class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An UnKnown error occurred."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'من فضلك أدخل كلمة مرور قوية');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure('بريد غير متاح');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'هناك حساب مرتبط بالفعل لهدا البريد');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'Operation is not allow');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'هذا المستخدم غير غير نشط');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
