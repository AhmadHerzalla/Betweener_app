// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
  List<User>? user;

  Search({
    this.user,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        user: json["user"] == null
            ? []
            : List<User>.from(json["user"]!.map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user == null
            ? []
            : List<dynamic>.from(user!.map((x) => x.toJson())),
      };
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? isActive;
  dynamic country;
  dynamic ip;
  String? long;
  String? lat;
  List<Link>? links;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    this.country,
    this.ip,
    this.long,
    this.lat,
    this.links,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        isActive: json["isActive"],
        country: json["country"],
        ip: json["ip"],
        long: json["long"],
        lat: json["lat"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "isActive": isActive,
        "country": country,
        "ip": ip,
        "long": long,
        "lat": lat,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
      };
}

class Link {
  int? id;
  String? title;
  String? link;
  String? username;
  String? isActive;
  String? userId;
  String? createdAt;
  String? updatedAt;

  Link({
    this.id,
    this.title,
    this.link,
    this.username,
    this.isActive,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        id: json["id"],
        title: json["title"],
        link: json["link"],
        username: json["username"],
        isActive: json["isActive"],
        userId: json["user_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "link": link,
        "username": username,
        "isActive": isActive,
        "user_id": userId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
