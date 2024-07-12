class User {
  String username;
  String email;
  String password;
  String birth;
  String address;

  User({
    required this.username,
    required this.email,
    required this.password,
    this.birth = '',
    this.address = '',
  });
}
