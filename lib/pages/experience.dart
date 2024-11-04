import 'package:flutter/material.dart';
import '../data/experience_details.dart';
import '../models/work_experience.dart';
import '../utils/responsive.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override

  /// Builds the UI for the ExperiencePage, displaying a list of work experiences.
  ///
  /// The widget shows a header with the text "Work Experience" followed by a
  /// horizontal divider. Below the header, it displays a list of work experiences
  /// either in a desktop or mobile view, depending on the screen size. The desktop
  /// view shows the duration, company name, title, and content of the work experience
  /// in a row. The mobile view provides a compact layout with the same information.
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Work Experience',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        if (!Responsive.isMobile(context))
          for (WorkExperienceModel workExperience in workExperienceList)
            workExperienceRow(
                duration: workExperience.duration,
                companyName: workExperience.companyName,
                title: workExperience.title,
                content: workExperience.content),
        if (Responsive.isMobile(context))
          for (WorkExperienceModel workExperience in workExperienceList)
            mobileViewExperience(
              duration: workExperience.duration,
              companyName: workExperience.companyName,
              title: workExperience.title,
              content: workExperience.content,
            )
      ],
    );
  }
}

/// A widget for displaying a single work experience in a row on a mobile device.
///
/// The widget displays the duration of the work experience, a work icon, the company name,
/// title, and content of the work experience. The duration, company name, and title are
/// displayed with font sizes of 16, 20, and 16 respectively. The content is displayed
/// with a font size of 14 and a maximum of two lines.
Widget mobileViewExperience(
    {required String duration,
    required String companyName,
    required String title,
    required List<String> content}) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(vertical: 15),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.teal.shade100, width: 2)),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(duration),
            const CircleAvatar(
              child: Icon(Icons.work),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              companyName,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            for (String text in content) bulletText(text),
          ],
        ),
      ],
    ),
  );
}

/// A widget for displaying a single work experience in a row.
///
/// The widget contains a `Text` widget for displaying the duration of the work
/// experience, a `CircleAvatar` widget for displaying a work icon, and a
/// `Column` widget containing a `Text` widget for displaying the company name
/// and title of the work experience, and a `Text` widget for each bullet point
/// in the content of the work experience.
///
/// The duration, company name, title, and content are provided as parameters
/// when creating the widget. The company name and title are displayed with a
/// font size of 24 and 16 respectively, and the bullet points are displayed with
/// a font size of 14. The content is displayed with a maximum of two lines.
///
/// The widget is intended to be used in the [ExperiencePage] widget.
Padding workExperienceRow(
    {required String duration,
    required String companyName,
    required String title,
    required List<String> content}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(duration),
        const SizedBox(
          width: 20,
        ),
        const CircleAvatar(
          child: Icon(Icons.work),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                companyName,
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
              for (String text in content) bulletText(text),
            ],
          ),
        )
      ],
    ),
  );
}

/// Builds a widget for displaying a bullet point text.
///
/// The widget consists of a row containing a bullet point character and the provided text.
/// The bullet point character is displayed with a font size of 14 and letter spacing of 1.2.
/// The text is displayed with the same letter spacing and is expanded to fill the available width.
/// A horizontal space of 8 is added between the bullet point character and the text.
Widget bulletText(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('•', style: TextStyle(fontSize: 14, letterSpacing: 1.2)),
      const SizedBox(width: 8),
      Expanded(
        child: Text(
          text,
          style: const TextStyle(letterSpacing: 1.2),
        ),
      ),
    ],
  );
}
