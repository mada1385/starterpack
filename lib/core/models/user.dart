class User {
  String id, name, email, phone;

  // List replyes, likedby;
  User(
    this.id,
    this.name,
    this.email,
    this.phone,
  );
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json["_id"],
      json["party"]["username"],
      json["party"]["email"],
      json["party"]["phone"].toString(),
    );
  }
  Map<String, dynamic> tojson() {
    Map<String, dynamic> json;

    json["_id"] = id;
    json["party"]["username"] = name;
    json["party"]["email"] = email;
    json["party"]["phone"] = phone;

    return json;
    // json['likedBy'].toList();
  }
}
