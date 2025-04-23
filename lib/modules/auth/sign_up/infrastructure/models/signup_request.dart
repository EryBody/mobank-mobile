// To parse this JSON data, do
//
//     final signupRequest = signupRequestFromJson(jsonString);

import 'dart:convert';

SignupRequest signupRequestFromJson(String str) => SignupRequest.fromJson(json.decode(str));

String signupRequestToJson(SignupRequest data) => json.encode(data.toJson());

class SignupRequest {
  final String emailAddress;
  final String displayName;
  final String password;
  final String confirmPassword;
  final String firstName;
  final String lastName;
  final String countryCode;
  final String mobileNumber;
  final String provider;
  final dynamic providerId;
  final dynamic referralCode;

  SignupRequest({
    required this.emailAddress,
    required this.displayName,
    required this.password,
    required this.confirmPassword,
    required this.firstName,
    required this.lastName,
    required this.countryCode,
    required this.mobileNumber,
    required this.provider,
    required this.providerId,
    required this.referralCode,
  });

  factory SignupRequest.fromJson(Map<String, dynamic> json) => SignupRequest(
    emailAddress: json["emailAddress"],
    displayName: json["displayName"],
    password: json["password"],
    confirmPassword: json["confirmPassword"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    countryCode: json["countryCode"],
    mobileNumber: json["mobileNumber"],
    provider: json["provider"],
    providerId: json["providerId"],
    referralCode: json["referralCode"],
  );

  Map<String, dynamic> toJson() => {
    "emailAddress": emailAddress,
    "displayName": displayName,
    "password": password,
    "confirmPassword": confirmPassword,
    "firstName": firstName,
    "lastName": lastName,
    "countryCode": countryCode,
    "mobileNumber": mobileNumber,
    "provider": provider,
    "providerId": providerId,
    "referralCode": referralCode,
  };
}
