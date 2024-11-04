import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/page_reloader.dart';
import '../utils/responsive.dart';
import 'action_button.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Function(int value) onPressed;
  final VoidCallback openDrawer;
  const AppBarWidget(
      {super.key, required this.onPressed, required this.openDrawer});

  @override
  /// Builds a custom app bar for the application.
  ///
  /// The app bar is transparent with white foreground components and no elevation.
  /// It contains a clickable title that triggers a page reload when tapped.
  /// The title includes a teal-colored terminal icon and an animated text that displays "Portfolio."
  /// On mobile devices, a drawer icon is displayed in the actions section to open the drawer.
  /// On larger screens, navigation buttons are shown instead of the drawer icon.
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      elevation: 0,
      title: InkWell(
        onTap: () {
          reloadPage();
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
