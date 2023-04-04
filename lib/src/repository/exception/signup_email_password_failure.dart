class SignUpWithEmailAndPasswordFailure {
  final String message;

 const SignUpWithEmailAndPasswordFailure(
      [this.message = "An unknown error occurred. "]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a stringer password.');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            'Email is not valid badly formatted.');
      case 'email-already-in-user':
        return const SignUpWithEmailAndPasswordFailure(
            'An account already exists for that email.');
      case 'opration-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'Operation is not allowed. Please contact support.');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help.');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
