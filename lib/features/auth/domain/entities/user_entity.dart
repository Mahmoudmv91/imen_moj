class UserEntity {
  final String uid;
  final String name;
  final String email;
  final String? avatar;
  final String? createdAt;

  UserEntity({
    required this.uid,
    required this.name,
    required this.email,
    this.createdAt,
    this.avatar,
  });
}
