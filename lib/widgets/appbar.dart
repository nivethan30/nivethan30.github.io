import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/responsive.dart';
import '../pages/splash_screen.dart';
import 'action_button.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Function(int value) onPressed;
  final VoidCallback openDrawer;
  const AppBarWidget(
      {super.key, required this.onPressed, required this.openDrawer});

  @override
  /// The custom app bar for the application, which appears on all pages.
  ///
  /// The app bar displays a clickable logo on the left, and a menu button
  /// on the right if the device is small enough to be considered a mobile
  /// device. If the device is large enough to be considered a computer, the
  /// app bar displays a set of navigation buttons instead of a menu button.
  ///
  /// The app bar is transparent and has no elevation, so it blends in with the
  /// background of the page. The text and icons on the app bar are colored
  /// white, and the logo is colored teal. When the logo is clicked, the app
  /// navigates back to the splash screen.
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

  /// Returns a list of [ActionButton]s to be used in the AppBar for
  /// non-mobile devices. The buttons are for the following pages, in order:
  ///
  /// 1. Home
  /// 2. About Me
  /// 3. Experience
  /// 4. Works
  /// 5. Contact
  ///
  /// The [onPressed] callback for each button is a call to [onPressed] with
  /// the corresponding index.
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
