import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginfirebase/src/features/core/models/users/users_model.dart';
import 'package:loginfirebase/src/repository/authentication_repository.dart';
import 'package:loginfirebase/src/utils/pickImage/pickImage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final Rx<bool> _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  setIsLoading(bool data) {
    _isLoading.value = data;
    update();
  }

  File? images;
  final _firebaseStorage = FirebaseStorage.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;

  final _userModel = Rxn<UserModel>();

  UserModel? get userModel => _userModel.value;

  setUserModel(UserModel? userModel) {
    _userModel.value = userModel;
    update();
  }

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final bio = TextEditingController();

  Future selectImage(BuildContext context) async {
    images = await pickImage(context);
    update();
  }

  //Call this Function from Design & it will do the rest
  void registerUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  void phoneAutentication(String phoneNo) async {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  Future savaUserDataToFirebase(
      {required UserModel userModel,
      required File profilePic,
      required Function onSuccess}) async {
    setIsLoading(true);
    try {
      String? uid = AuthenticationRepository.instance.firebaseUser.value?.uid;
      String? phoneNumber =
          AuthenticationRepository.instance.firebaseUser.value?.phoneNumber;
      await storeFileToStorage("profilePic/$uid", profilePic).then((value) {
        userModel.profilePic = value;
        userModel.createdAt = DateTime.now().millisecondsSinceEpoch.toString();
        userModel.phoneNumber = phoneNumber;
        userModel.uid = uid;
      });
      _userModel.value = userModel;

      await _firebaseFirestore
          .collection("users")
          .doc(uid)
          .set(userModel.toMap())
          .then((value) {
        onSuccess();
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.toString());
    }
    setIsLoading(false);
    update();
  }

  Future<String> storeFileToStorage(String ref, File file) async {
    UploadTask uploadTask = _firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future saveUserDataToSp() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("user_model", jsonEncode(userModel!.toMap()));
  }

  Future getDataFromSp() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String data = preferences.getString("user_model") ?? '';
    _userModel.value = UserModel.fromMap(jsonDecode(data));
    update();
  }

  Future getDataFromFirebasestore() async {
    await _firebaseFirestore
        .collection("users")
        .doc(AuthenticationRepository.instance.firebaseUser.value!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      _userModel.value = UserModel(
        name: snapshot["name"],
        email: snapshot["email"],
        bio: snapshot["bio"],
        profilePic: snapshot["profilePic"],
        createdAt: snapshot["createdAt"],
        phoneNumber: snapshot["phoneNumber"],
        uid: snapshot["uid"],
      );
      update();
    });
  }
}
