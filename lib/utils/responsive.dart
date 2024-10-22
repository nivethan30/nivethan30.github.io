import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const Responsive(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});


/// Determines if the device screen width is less than 650 pixels, indicating a mobile device.
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  /// Determines if the device screen width is less than 1100 pixels but greater than or equal to 650 pixels, indicating a tablet device.
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  /// Determines if the device screen width is greater than or equal to 1100 pixels, indicating a desktop device.
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  /// Returns the appropriate widget for the given screen width. If the width
  /// is greater than or equal to 1100, returns [desktop]. If the width is less
  /// than 1100 but greater than or equal to 650, returns [tablet]. Otherwise,
  /// returns [mobile].
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1100) {
        return desktop;
      } else if (constraints.maxWidth >= 650) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
