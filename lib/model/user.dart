class User {
  late final int id;
  late final String name;
  late final String username;
  late final String email;
  late final String phone;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.phone});

  factory User.fromjson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        phone: json['phone']);
  }
}
