import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  int? userId;
  String? fname;
  String? lname;
  String? username;
  String? password;
  String? role;
  DateTime? createdAt;

  User({
    this.userId,
    this.fname,
    this.lname,
    this.username,
    this.password,
    this.role,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        fname: json["fname"],
        lname: json["lname"],
        username: json["username"],
        password: json["password"],
        role: json["role"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fname": fname,
        "lname": lname,
        "username": username,
        "password": password,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
      };
}
