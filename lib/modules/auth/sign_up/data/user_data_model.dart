class UserData {
  final String firstName;
  final String lastName;
  final String dob;
  final String email;
  final String password;
  final String confirmPassword;
  final String? countryCode;
  final String? country;
  final String? language;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.countryCode,
    this.country,
    this.language,
  });

  // Convert the object to a Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'dob': dob,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'countryCode': countryCode,
      'country': country,
      'language': language,
    };
  }

  // Create an instance from a Map (JSON)
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      firstName: json['firstName'],
      lastName: json['lastName'],
      dob: json['dob'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
      countryCode: json['countryCode'],
      country: json['country'],
      language: json['language'],
    );
  }
}
