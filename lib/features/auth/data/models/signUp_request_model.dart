class SignupRequestModel {
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  final String city;

  SignupRequestModel({
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.password,
    required this.city,
  });
  Map<String, dynamic> toJson() {
    return {
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "password": password,
      "city": city,
    };
  }
}
