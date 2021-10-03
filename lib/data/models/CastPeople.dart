//model for credits people in single movie
class CastPeople {
  CastPeople({
    required this.cast,
  });

  List<CastElement> cast;

  factory CastPeople.fromJson(Map<String, dynamic> json) {
    return CastPeople(
      cast: List<CastElement>.from(
          json["cast"].map((x) => CastElement.fromJson(x))),
    );
  }
}

class CastElement {
  CastElement({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
  });

  int id;
  String name;
  String? profilePath;
  String character;

  factory CastElement.fromJson(Map<String, dynamic> json) {
    return CastElement(
      id: json["id"],
      name: json["name"],
      profilePath: json["profile_path"] == null ? null : json["profile_path"],
      character: json["character"] == null ? 'none' : json["character"],
    );
  }
}
