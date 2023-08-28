// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  String? message;
  User? user;
  String? token;

  Register({
    this.message,
    this.user,
    this.token,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user?.toJson(),
        "token": token,
      };
}

class User {
  String? name;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;

  User({
    this.name,
    this.email,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "id": id,
      };
}
