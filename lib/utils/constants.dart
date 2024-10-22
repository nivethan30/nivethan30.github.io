import 'package:url_launcher/url_launcher.dart';

class Assets {
  static const String flutterLogo = "assets/svg/flutter.svg";
  static const String dartLogo = "assets/svg/dart.svg";
  static const String javascriptLogo = "assets/svg/javascript.svg";
  static const String nodejsLogo = "assets/svg/nodejs.svg";
  static const String mysqlLogo = "assets/svg/mysql.svg";
  static const String mongoDbLogo = "assets/svg/mongodb.svg";

  static const String photo = "assets/photo/photo.jpg";
}

/// Concatenates a list of strings into a single string, separated by commas.
///
/// Takes a list of strings [data] and returns a single string where each
/// element is joined by a comma.
///
/// Example:
/// 
/// ```dart
/// List<String> items = ['apple', 'banana', 'cherry'];
/// String result = getSting(items); // 'apple, banana, cherry'
/// ```
String getSting(List<String> data) {
  return data.join(", ");
}

  /// Launches the default application for the given [url].
  ///
  /// Does nothing if [url] is empty or if the default application cannot
  /// be launched.
  ///
  /// Example:
  ///
  /// * `https://example.com` - Launches the default browser with the given URL
  /// * `mailto:user@example.com` - Launches the default mail client with the
  ///   given email address
  /// * `tel:+1234567890` - Launches the default phone app with the given phone
  ///   number
Future<void> launchURL(String url) async {
  if (url.isNotEmpty && await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  }
}

  /// Launch the default mail client with the address
  /// [arunnivethan435@gmail.com].
Future<void> launchMail() async {
  await launchUrl(Uri.parse("mailto:arunnivethan435@gmail.com"));
}
