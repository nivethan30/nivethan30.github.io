import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/project_details.dart';
import '../utils/constants.dart';
import '../models/projects.dart';
import '../utils/responsive.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override

  /// Builds the UI for the WorkPage, displaying a list of projects.
  ///
  /// The widget shows a header with the text "Some things I've Built"
  /// followed by a horizontal divider. Below the header, it displays
  /// a list of projects either in a desktop or mobile view, depending
  /// on the screen size. The desktop view shows detailed information
  /// about each project, including the title, content, languages used,
  /// image, application URL, and GitHub URL. The mobile view provides
  /// a compact layout with the same information.
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
              imageUrl: project.imageUrl,
              applicationUrl: project.applicationUrl ?? "",
              githubUrl: project.githubUrl),
      if (Responsive.isMobile(context))
        for (ProjectModel project in projects.reversed)
          mobileViewContent(
              title: project.title,
              content: project.content,
              languages: getSting(project.languageUsed),
              applicationUrl: project.applicationUrl ?? "",
              imageUrl: project.imageUrl,
              githubUrl: project.githubUrl)
    ]);
  }
}

/// Builds the mobile view for the WorkPage, displaying a single project
/// in a column with an image at the top and a column of text below it.
/// The image is a link to the project's image URL. The column of text
/// contains the project's title, languages used, content, and a link to
/// the project's GitHub URL. If the project has an application URL,
/// it also displays a link to the application URL.
Widget mobileViewContent(
    {required String title,
    required String content,
    required String languages,
    required String imageUrl,
    required String applicationUrl,
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
        InkWell(
          onTap: () {
            launchURL(imageUrl);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 200,
            width: 300,
            child: Image.network(
              imageUrl,
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Text("Failed to Load image"),
              ),
            ),
          ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      launchURL(githubUrl);
                    },
                    child: const FaIcon(FontAwesomeIcons.github)),
                if (applicationUrl.isNotEmpty) const SizedBox(width: 20),
                if (applicationUrl.isNotEmpty)
                  InkWell(
                      onTap: () {
                        launchURL(applicationUrl);
                      },
                      child: const FaIcon(FontAwesomeIcons.upRightFromSquare)),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

/// A widget for displaying the content of a project on the desktop
///
/// This widget takes the title, content, languages, image URL, GitHub URL, and
/// application URL of a project as parameters and displays them in a row.
/// The image is displayed on the left, and the text content is displayed on
/// the right. The GitHub and application URLs are displayed as icons on the
/// right side of the text content.
///
/// The [imageUrl] parameter is required, but the [applicationUrl] parameter
/// is optional. If [applicationUrl] is empty, the application URL icon is
/// not displayed.
///
/// This widget is intended to be used in the [DesktopView] widget.
Widget desktopViewContent(
    {required String title,
    required String content,
    required String languages,
    required String imageUrl,
    required String githubUrl,
    required String applicationUrl}) {
  return Container(
    color: Colors.blue.shade900.withOpacity(0.1),
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            launchURL(imageUrl);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 200,
            width: 300,
            child: Image.network(
              imageUrl,
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Text("Failed to Load image"),
              ),
            ),
          ),
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
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      launchURL(githubUrl);
                    },
                    child: const FaIcon(FontAwesomeIcons.github)),
                if (applicationUrl.isNotEmpty) const SizedBox(width: 10),
                if (applicationUrl.isNotEmpty)
                  InkWell(
                      onTap: () {
                        launchURL(applicationUrl);
                      },
                      child: const FaIcon(FontAwesomeIcons.upRightFromSquare)),
              ],
            ))
      ],
    ),
  );
}
