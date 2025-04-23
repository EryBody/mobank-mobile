// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  final String emailAddress;
  final String password;
  final String provider;
  final String providerId;

  LoginRequest({
    required this.emailAddress,
    required this.password,
    required this.provider,
    required this.providerId,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    emailAddress: json["emailAddress"],
    password: json["password"],
    provider: json["provider"],
    providerId: json["providerId"],
  );

  Map<String, dynamic> toJson() => {
    "emailAddress": emailAddress,
    "password": password,
    "provider": provider,
    "providerId": providerId,
  };
}
