class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure(
      [this.message = "An UnKnown error occurred."]);

  factory LogInWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const LogInWithEmailAndPasswordFailure(
            'من فضلك أدخل كلمة مرور قوية');
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure('بريد غير متاح');
      case 'email-already-in-use':
        return const LogInWithEmailAndPasswordFailure(
            'هناك حساب مرتبط بالفعل لهدا البريد');
      case 'operation-not-allowed':
        return const LogInWithEmailAndPasswordFailure('Operation is not allow');
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
            'هذا المستخدم غير غير نشط');
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  static fromCode(String code) {}
}
