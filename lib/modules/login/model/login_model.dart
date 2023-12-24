// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String message;
  User user;
  String token;

  LoginModel({
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  String clientName;
  String mail;
  int country;
  bool clientStatus;
  String clientPhone;
  int clientGender;
  int clientId;

  User({
    required this.clientName,
    required this.mail,
    required this.country,
    required this.clientStatus,
    required this.clientPhone,
    required this.clientGender,
    required this.clientId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        clientName: json["client_name"],
        mail: json["mail"],
        country: json["country"],
        clientStatus: json["client_status"],
        clientPhone: json["client_phone"],
        clientGender: json["client_gender"],
        clientId: json["client_id"],
      );

  Map<String, dynamic> toJson() => {
        "client_name": clientName,
        "mail": mail,
        "country": country,
        "client_status": clientStatus,
        "client_phone": clientPhone,
        "client_gender": clientGender,
        "client_id": clientId,
      };
}
