// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User1 userFromJson(String str) => User1.fromJson(json.decode(str));

String userToJson(User1 data) => json.encode(data.toJson());

class User1 {
  UserClass? user;
  String? token;

  User1({
    this.user,
    this.token,
  });

  factory User1.fromJson(Map<String, dynamic> json) => User1(
        user: json["user"] == null ? null : UserClass.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
      };
}

class UserClass {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? isActive;
  dynamic country;
  dynamic ip;
  dynamic long;
  dynamic lat;

  UserClass({
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
  });

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
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
      };
}
