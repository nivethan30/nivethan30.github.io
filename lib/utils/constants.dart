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

class WorkExperience {
  static const String flutterInternDuration = "Mar 2023 - Jun 2023";
  static const String flutterInternCompany =
      "Aara Infosystems Pvt. Ltd. Chennai.";
  static const String flutterInternTitle = "Flutter Developer - Intern\n";
  static const String flutterInternContent =
      "As a Flutter Developer Intern, I gained hands-on experience with Dart and Flutter, learning the core fundamentals of mobile app development. I developed skills in building responsive UIs, integrating APIs, and optimizing app performance. This internship enhanced my ability to create cross-platform applications efficiently.";

  static const String flutterDeveloperDuration = "Jun 2023 - Aug 2024";
  static const String flutterDeveloperCompany =
      "Aara Infosystems Pvt. Ltd. Chennai.";
  static const String flutterDeveloperTitle =
      "Flutter Developer - Full Stack\n";
  static const String flutterDeveloperContent =
      "Flutter Expertise: Developed high-performance cross-platform apps with a focus on responsive UI design and smooth user experiences.\n\nNode.js Backend Developer: Designed and implemented robust APIs to support application functionality.\n\nDatabase Proficiency: Managed MySQL and MongoDB databases, ensuring efficient data handling and integration.\n\nKubernetes DevOps Beginner: Gained foundational experience in deploying applications for scalability and reliability.";
}

String getSting(List<String> data) {
  return data.join(", ");
}

Future<void> launchURL(String url) async {
  if (url.isNotEmpty && await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  }
}

Future<void> launchMail() async {
  await launchUrl(Uri.parse("mailto:arunnivethan435@gmail.com"));
}
