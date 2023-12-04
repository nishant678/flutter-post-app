// To parse this JSON data, do
//
//     final userPostByIdMode = userPostByIdModeFromJson(jsonString);

import 'dart:convert';

UserPostByIdMode userPostByIdModeFromJson(String str) =>
    UserPostByIdMode.fromJson(json.decode(str));

String userPostByIdModeToJson(UserPostByIdMode data) =>
    json.encode(data.toJson());

class UserPostByIdMode {
  int userId;
  int id;
  String title;
  String body;

  UserPostByIdMode({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory UserPostByIdMode.fromJson(Map<String, dynamic> json) =>
      UserPostByIdMode(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
