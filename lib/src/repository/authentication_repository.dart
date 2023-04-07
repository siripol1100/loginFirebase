import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:loginfirebase/src/features/authentication/controllers/signup_controller.dart';
import 'package:loginfirebase/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:loginfirebase/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:loginfirebase/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import 'package:loginfirebase/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:loginfirebase/src/features/core/models/users/users_model.dart';
import 'package:loginfirebase/src/features/core/screens/dashboard/dashboard.dart';
import 'package:loginfirebase/src/repository/exception/login_email_password_failure.dart';
import 'package:loginfirebase/src/repository/exception/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
  final _firebaseFirestore = FirebaseFirestore.instance;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : checkExistingUser();
  }

  Future<void> phoneAuthentication(String phone) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId.value = verificationId;
        Get.to(() => OTPScreen());
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phon number is not valid.');
        } else {
          Get.snackbar('Error', 'Something went wrong try again');
        }
      },
    );
  }

  Future<bool> authenverifyOTP(String otp) async {
    UserCredential? credentials;
    try {
      credentials = await _auth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: verificationId.value, smsCode: otp));
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    return credentials?.user != null ? true : false;
  }

  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot = await _firebaseFirestore
        .collection("users")
        .doc(firebaseUser.value?.uid)
        .get();

    if (snapshot.exists) {
      print("USER EXISTS");
      getDataFromFirebasestore()
          .then((value) => Get.put(SignUpController()).saveUserDataToSp())
          .then((value) => Get.put(SignUpController())
              .getDataFromSp()
              .whenComplete(() => Get.offAll(() => const Dashboard())));

      return true;
    } else {
      print("NEW USER");
      Get.offAll(() => const SignupScreen());
      return false;
    }
  }

  Future getDataFromFirebasestore() async {
    await _firebaseFirestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      Get.put(SignUpController()).setUserModel(UserModel(
        name: snapshot["name"],
        email: snapshot["email"],
        bio: snapshot["bio"],
        profilePic: snapshot["profilePic"],
        createdAt: snapshot["createdAt"],
        phoneNumber: snapshot["phoneNumber"],
        uid: snapshot["uid"],
      ));
    });
  }

  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREVASE AUTH EXCEPTION ${ex.message}');
      return ex.message;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = LoginWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = LoginWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();
}
