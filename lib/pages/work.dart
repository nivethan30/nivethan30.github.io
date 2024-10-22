import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/constants.dart';
import '../models/projects.dart';
import '../utils/responsive.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Row(
        children: [
          Text(
            "Some things I've Built",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          )
        ],
      ),
      const SizedBox(
        height: 50,
      ),
      if (!Responsive.isMobile(context))
        for (ProjectModel project in projects.reversed)
          desktopViewContent(
              title: project.title,
              content: project.content,
              languages: getSting(project.languageUsed),
              githubUrl: project.githubUrl),
      if (Responsive.isMobile(context))
        for (ProjectModel project in projects.reversed)
          mobileViewContent(
              title: project.title,
              content: project.content,
              languages: getSting(project.languageUsed),
              githubUrl: project.githubUrl)
    ]);
  }
}

Widget mobileViewContent(
    {required String title,
    required String content,
    required String languages,
    required String githubUrl}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.teal.shade100, width: 2),
    ),
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 200,
          width: 150,
          child: const Placeholder(),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
            Text(languages, style: const TextStyle(fontSize: 16)),
            Text(content, style: const TextStyle(fontSize: 14)),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                  onTap: () {
                    launchURL(githubUrl);
                  },
                  child: const FaIcon(FontAwesomeIcons.github)),
            )
          ],
        ),
      ],
    ),
  );
}

Widget desktopViewContent(
    {required String title,
    required String content,
    required String languages,
    required String githubUrl}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 200,
          width: 150,
          child: const Placeholder(),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
              Text(languages, style: const TextStyle(fontSize: 16)),
              Text(content, style: const TextStyle(fontSize: 14)),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    launchURL(githubUrl);
                  },
                  child: const FaIcon(FontAwesomeIcons.github))
            ],
          ),
        )
      ],
    ),
  );
}

List<ProjectModel> projects = [
  ProjectModel(
      title: 'Todo Application Using Sqflite & Provider',
      content:
          'A simple task application in Flutter UI With Sqflite for data persistence and Provider for the State Management and made theme configurations for both dark and light modes',
      languageUsed: ['Flutter', 'Dart', 'Flutter UI'],
      imageUrl: "",
      githubUrl:
          "https://github.com/nivethan30/Flutter-Todo-Application-Sqflite-Provider"),
  ProjectModel(
      title: 'Notes Application Using Sqflite & Provider',
      content:
          'A simple Note taking application in Flutter UI With Sqflite for data persistence and Provider for the State Management and made theme configurations for both dark and light modes',
      languageUsed: ['Flutter', 'Dart', 'Flutter UI'],
      imageUrl: "",
      githubUrl:
          "https://github.com/nivethan30/Flutter-Notes-App-Sqflite-Provider"),
  ProjectModel(
      title: 'TMDB Movie Application Using Flutter Bloc',
      content:
          'A TMDB Movie Application is Developed in Flutter and Fetch data from the REST Api method using Dio Package and Managed the State using Flutter Bloc',
      languageUsed: ['Flutter', 'Dart', 'Flutter UI'],
      imageUrl: "",
      githubUrl:
          "https://github.com/nivethan30/TMDB_Movie_Application_Flutter_Bloc"),
  ProjectModel(
      title: 'Weather Application Using Riverpod & OpenWeatherMap',
      content:
          'A Weather Application using OpenweatherMap Package has been built and the state is managed using flutter riverpod package and for location accuracy geolocator is used and made theme configurations for both dark and light modes.',
      languageUsed: ['Flutter', 'Dart', 'Flutter UI'],
      imageUrl: "",
      githubUrl:
          "https://github.com/nivethan30/Weather-Application-Flutter-Riverpod"),
  ProjectModel(
      title: 'Firebase Authentication Application using Flutter',
      content:
          "An Responsive Application for web and mobile using flutter and firebase authentication includes the login methods, sign up and sign in with google then connect with the firestore database to store the userdata and using firebase storage to update the profile picture.",
      languageUsed: ['Flutter', 'Dart', 'Flutter UI'],
      imageUrl: "",
      githubUrl: ""),
  ProjectModel(
      title: "Personal Portfolio using Flutter UI",
      content:
          "A Personal Portfolio using Flutter UI with Responsive for Web and Mobile and even for windows, linux and macos",
      languageUsed: ["Flutter", "Dart", "Flutter UI"],
      imageUrl: "",
      githubUrl: "")
];
