import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import '../widgets/action_button.dart';
import '../widgets/social_widgets.dart';
import '../utils/constants.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            Text(
              'Get In Touch',
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
        Column(
          children: [
            const Text(
              'Contact Me',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              textAlign: TextAlign.center,
              "Althought I'm currently looking for SDE-1 Oppertunity. I'm always open to discussing new projects or opportunites. Shoot me an email at arunnivethan435@gmail.com or connect with me on Linkedin. I'm always open to new projects and opportunites. ",
            ),
            const SizedBox(
              height: 30,
            ),
            ActionButton(
              text: 'Get In Touch',
              onPressed: () {
                launchURL(
                    'https://api.whatsapp.com/send/?phone=%2B918220475560&text=Hey%20there!&type=phone_number&app_absent=0');
              },
              isBorder: true,
            ),
          ],
        ),
        if (!Responsive.isDesktop(context))
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [...socialButtons()],
          ),
        const Column(),
        const Align(
            alignment: Alignment.bottomCenter,
            child: Text('Designed And Built By Arun Nivethan')),
      ],
    );
  }
}
