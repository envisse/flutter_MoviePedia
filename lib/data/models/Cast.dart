class Cast {
  Cast({
    required this.cast,
  });

  List<CastElement> cast;

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
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
    required this.castId,
    required this.character,
  });

  int id;
  String name;
  String profilePath;
  int castId;
  String character;

  factory CastElement.fromJson(Map<String, dynamic> json) {
    return CastElement(
      id: json["id"],
      name: json["name"],
      profilePath: json["profile_path"] == null ? 'none' : json["profile_path"],
      castId: json["cast_id"] == null ? 'none' : json["cast_id"],
      character: json["character"] == null ? 'none' : json["character"],
    );
  }
}
