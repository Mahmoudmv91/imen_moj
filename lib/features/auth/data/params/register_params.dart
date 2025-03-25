class RegisterParams {
  final String fullName;
  final String email;
  final String password;
  final String? userAvatar;

  const RegisterParams({
    required this.fullName,
    required this.email,
    required this.password,
    this.userAvatar,
  });
}
