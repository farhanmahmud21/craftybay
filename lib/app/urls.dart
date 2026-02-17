class Urls {
  Urls._(); // Private Constructor
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';

  static const String signUpUrl = '$_baseUrl/auth/signup';
  static const String verify_otp = '$_baseUrl/auth/verify-otp';
  static const String login = '$_baseUrl/auth/login';

  static const String slides = '$_baseUrl/slides';
}
