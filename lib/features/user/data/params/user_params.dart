class UserParams {
  final String uid;
  final String fullName;
  final String email;
  final String? userAvatar;

  const UserParams({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.userAvatar,
  });

  Map<String,dynamic> toMap(){
    return {
      'uid':uid,
      'name':fullName,
      'email':email,
      'avatar':userAvatar,
    };
  }
}
