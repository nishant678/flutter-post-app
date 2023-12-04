// To parse this JSON data, do
//
//     final userPostModeL = userPostModeLFromJson(jsonString);

import 'dart:convert';

List<UserPostModeL> userPostModeLFromJson(String str) =>
    List<UserPostModeL>.from(
        json.decode(str).map((x) => UserPostModeL.fromJson(x)));

String userPostModeLToJson(List<UserPostModeL> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserPostModeL {
  int userId;
  int id;
  String title;
  String body;

  UserPostModeL({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory UserPostModeL.fromJson(Map<String, dynamic> json) => UserPostModeL(
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
