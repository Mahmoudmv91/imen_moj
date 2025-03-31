class CreateUserParams {
  final String fullName;
  final String email;
  final String password;
  final String? userAvatar;

  const CreateUserParams({
    required this.fullName,
    required this.email,
    required this.password,
    required this.userAvatar,
  });
}
