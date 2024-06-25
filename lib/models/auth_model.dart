// To parse this JSON data, do
//
//     final auth = authFromJson(jsonString);

import 'dart:convert';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
  int? userId;
  String? fname;
  String? lname;
  String? username;
  String? role;
  DateTime? createdAt;
  String? token;

  Auth({
    this.userId,
    this.fname,
    this.lname,
    this.username,
    this.role,
    this.createdAt,
    this.token,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        userId: json["user_id"],
        fname: json["fname"],
        lname: json["lname"],
        username: json["username"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fname": fname,
        "lname": lname,
        "username": username,
        "role": role,
        "token": token,
      };
}
