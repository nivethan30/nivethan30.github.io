import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/constants.dart';

Expanded socialWidget() {
  return Expanded(
    flex: 1,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ...socialButtons(),
        const SizedBox(
          height: 100,
          child: VerticalDivider(
            width: 2,
          ),
        )
      ],
    ),
  );
}

Widget customIconButton(
    {required IconData iconData, required VoidCallback onPressed}) {
  return IconButton(
      icon: FaIcon(
        iconData,
        color: Colors.teal.shade100,
      ),
      onPressed: onPressed);
}

List<Widget> socialButtons() {
  return [
    customIconButton(
        iconData: FontAwesomeIcons.linkedin,
        onPressed: () {
          launchURL('https://www.linkedin.com/in/nivethan30/');
        }),
    customIconButton(
        iconData: FontAwesomeIcons.github,
        onPressed: () {
          launchURL("https://github.com/nivethan30");
        }),
    customIconButton(
        iconData: FontAwesomeIcons.whatsapp,
        onPressed: () {
          launchURL(
              'https://api.whatsapp.com/send/?phone=%2B918220475560&text=Hey%20there!&type=phone_number&app_absent=0');
        }),
    customIconButton(
        iconData: FontAwesomeIcons.envelope,
        onPressed: () {
          launchMail();
        }),
  ];
}
