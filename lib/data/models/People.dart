class People {
  late String name;
  late int id;
  late String? birthday;
  late String gender;
  late String? biography;
  late String? placeOfBirth;
  late String? profilePath;

  People(
      {required this.name,
      required this.id,
      required this.birthday,
      required this.gender,
      required this.biography,
      required this.placeOfBirth,
      required this.profilePath});

  factory People.fromjson(Map<String, dynamic> json) {
    return People(
        name: json['name'],
        id: json['id'],
        birthday: (json['birthday'] != null) ? json['birthday'] : 'Unknown',
        gender: (json['gender'] == 2) ? 'male' : 'female',
        biography: (json['biography'] != null) ? json['biography'] : 'Unknown',
        placeOfBirth: (json['place_of_birth'] != null)
            ? json['place_of_birth']
            : 'Unknown',
        profilePath: (json['profile_path'] != null) ? json['profile_path'] : null);
  }
}