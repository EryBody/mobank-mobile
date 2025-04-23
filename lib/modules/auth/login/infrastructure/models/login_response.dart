// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final int responseCode;
  final bool status;
  final String message;
  final Data data;

  LoginResponse({
    required this.responseCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    responseCode: json["responseCode"],
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode,
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  final String userId;
  final String accessToken;
  final String refreshToken;
  final UserData userData;

  Data({
    required this.userId,
    required this.accessToken,
    required this.refreshToken,
    required this.userData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["userId"],
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
    userData: UserData.fromJson(json["userData"]),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "accessToken": accessToken,
    "refreshToken": refreshToken,
    "userData": userData.toJson(),
  };
}

class UserData {
  final String username;
  final String emailAddress;
  final dynamic firstName;
  final dynamic lastName;
  final String mobileNumber;
  final String countryCode;
  final String timezone;
  final dynamic referralCode;
  final String profilePicture;
  final bool biometrics;
  final UserStatus userStatus;
  final String provider;
  final dynamic providerId;

  UserData({
    required this.username,
    required this.emailAddress,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.countryCode,
    required this.timezone,
    required this.referralCode,
    required this.profilePicture,
    required this.biometrics,
    required this.userStatus,
    required this.provider,
    required this.providerId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    username: json["username"],
    emailAddress: json["emailAddress"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    mobileNumber: json["mobileNumber"],
    countryCode: json["countryCode"],
    timezone: json["timezone"],
    referralCode: json["referralCode"],
    profilePicture: json["profilePicture"],
    biometrics: json["biometrics"],
    userStatus: UserStatus.fromJson(json["userStatus"]),
    provider: json["provider"],
    providerId: json["providerId"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "emailAddress": emailAddress,
    "firstName": firstName,
    "lastName": lastName,
    "mobileNumber": mobileNumber,
    "countryCode": countryCode,
    "timezone": timezone,
    "referralCode": referralCode,
    "profilePicture": profilePicture,
    "biometrics": biometrics,
    "userStatus": userStatus.toJson(),
    "provider": provider,
    "providerId": providerId,
  };
}

class UserStatus {
  final int id;
  final String status;

  UserStatus({
    required this.id,
    required this.status,
  });

  factory UserStatus.fromJson(Map<String, dynamic> json) => UserStatus(
    id: json["id"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
  };
}
