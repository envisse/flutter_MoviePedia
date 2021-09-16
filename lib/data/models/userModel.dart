class User {
  late final int id;
  late final String name;
  late final String username;
  late final String email;
  late final String phone;
  late final String woy;
  late final Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.company,
  });

  factory User.fromjson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      company: Company.fromjson(json["company"]),
    );
  }
}

class Company {
  late final String name;
  late final String catchPhrase;
  late final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromjson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}
