import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/responsive.dart';
import '../pages/splashscreen.dart';
import 'action_button.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Function(int value) onPressed;
  final VoidCallback openDrawer;
  const AppBarWidget(
      {super.key, required this.onPressed, required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      elevation: 0,
      title: InkWell(
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SplashScreen()));
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              FontAwesomeIcons.terminal,
              color: Colors.teal.shade100,
            ),
            const SizedBox(
              width: 2,
            ),
            AnimatedTextKit(
              isRepeatingAnimation: false,
              animatedTexts: [
                RotateAnimatedText('Portfolio.',
                    rotateOut: false,
                    textStyle: TextStyle(
                        color: Colors.teal.shade100,
                        fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
      ),
      actions: [
        if (Responsive.isMobile(context))
          IconButton(
              onPressed: openDrawer, icon: const FaIcon(FontAwesomeIcons.bars)),
        if (!Responsive.isMobile(context)) ...navigationButtons()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  List<ActionButton> navigationButtons() {
    return [
      ActionButton(text: 'Home', onPressed: () => onPressed(0)),
      ActionButton(text: 'About Me', onPressed: () => onPressed(1)),
      ActionButton(text: 'Experience', onPressed: () => onPressed(2)),
      ActionButton(text: 'Works', onPressed: () => onPressed(3)),
      ActionButton(text: 'Contact', onPressed: () => onPressed(4)),
    ];
  }
}
