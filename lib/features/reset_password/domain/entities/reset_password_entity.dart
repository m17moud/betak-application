class ResetPasswordEntity {
  final String pkey;
  final String tp;
  final String email;
  final String newPassword;
  ResetPasswordEntity(
      {required this.pkey,
      required this.tp,
      required this.email,
      required this.newPassword});
}
