class LoginWithEmailAndPasswordFailure {
  final String message;

  const LoginWithEmailAndPasswordFailure(
      [this.message = "An unknown error occurred. "]);

  factory LoginWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'user-not-found':
        return const LoginWithEmailAndPasswordFailure(
            'No user found for that email.');
      default:
        return const LoginWithEmailAndPasswordFailure(
            'Wrong password provided for that user.');
    }
  }
}
