import 'package:flutter/material.dart';
import '../models/work_experience.dart';
import '../utils/constants.dart';
import '../utils/responsive.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
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

List<WorkExperienceModel> workExperienceList = [
  WorkExperienceModel(
    companyName: WorkExperience.flutterInternCompany,
    title: WorkExperience.flutterInternTitle,
    content: WorkExperience.flutterInternContent,
    duration: WorkExperience.flutterInternDuration,
  ),
  WorkExperienceModel(
    companyName: WorkExperience.flutterDeveloperCompany,
    title: WorkExperience.flutterDeveloperTitle,
    content: WorkExperience.flutterDeveloperContent,
    duration: WorkExperience.flutterDeveloperDuration,
  ),
];

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
