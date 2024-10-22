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

/// Widget for displaying work experience details in a mobile view.
/// 
/// Displays the duration, company name, title, and content of the work experience in a styled container.
/// The duration is shown with a work icon, company name, title, and content are displayed in a column.
/// 
/// Parameters:
/// - [duration]: The duration of the work experience.
/// - [companyName]: The name of the company.
/// - [title]: The title of the work experience.
/// - [content]: The content describing the work experience.
Widget mobileViewExperience(
    {required String duration,
    required String companyName,
    required String title,
    required String content}) {
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
            Text(
              content,
              style: const TextStyle(letterSpacing: 1.2),
            )
          ],
        ),
      ],
    ),
  );
}

/// Builds a row widget for displaying work experience details.
/// 
/// The row includes the duration, company name, title, and content of the work experience.
/// It consists of a row with a circle avatar icon representing work, followed by the company name,
/// title, and content displayed in a column.
/// 
/// Parameters:
/// - [duration]: The duration of the work experience.
/// - [companyName]: The name of the company.
/// - [title]: The title of the work experience.
/// - [content]: The content describing the work experience.
Padding workExperienceRow(
    {required String duration,
    required String companyName,
    required String title,
    required String content}) {
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
              Text(
                content,
                style: const TextStyle(letterSpacing: 1.2),
              )
            ],
          ),
        )
      ],
    ),
  );
}
