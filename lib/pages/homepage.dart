import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/action_button.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onContactPressed;
  const HomePage({super.key, required this.onContactPressed});

  @override
  /// Builds the home page widget, which displays a brief introduction to
  /// myself, along with a button to download my CV. The text is styled
  /// using [AutoSizeText] widgets to ensure that the text is displayed
  /// in a readable size on all devices. The button is an [ActionButton]
  /// that launches a URL when pressed.
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          minFontSize: 16,
          maxFontSize: 16,
          'Hi, I am',
          style:
              TextStyle(color: Colors.tealAccent, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        AutoSizeText(
          'Arun Nivethan',
          maxFontSize: 60,
          minFontSize: 40,
          style: TextStyle(
              color: Colors.tealAccent.shade100, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        AutoSizeText(
          'Cross-Platfrom Flutter Developer',
          maxFontSize: 40,
          minFontSize: 20,
          style: TextStyle(
              color: Colors.tealAccent.shade200, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const AutoSizeText(
          'I am Flutter Developer Residing Tamilnadu, India specializing in building Mobile Applications.',
          maxFontSize: 16,
          minFontSize: 16,
          maxLines: 3,
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5),
        ),
        const SizedBox(height: 40),
        ActionButton(
          text: 'Download My CV ',
          onPressed: () {
            launchURL(
                "https://drive.google.com/file/d/1HiOkvUNqYRYaQAD9CDGL1PuXw7nAy0Kv/view?usp=sharing");
          },
          isBorder: true,
        )
      ],
    );
  }
}
