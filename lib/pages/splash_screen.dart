import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  /// This method is called when the widget is inserted into the tree.
  ///
  /// It first calls the super class's init state, then waits for 2 seconds
  /// before calling the _navigate method, which navigates to the
  /// [MainPage].
  ///
  /// This is used to create a splash screen that shows for 2 seconds before
  /// showing the main page of the app.
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      _navigate();
    });
  }

  /// Navigates to the [MainPage] using [Navigator.pushReplacement].
  ///
  /// This is used to navigate to the main page of the app after the
  /// splash screen has finished showing.
  void _navigate() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MainPage()));
  }

  @override
  /// Builds the splash screen widget.
  ///
  /// The splash screen widget is a [Scaffold] with a [Center] widget as its
  /// body. The [Center] widget contains a [Column] widget with a
  /// [FontAwesomeIcons.terminal] icon and a [LinearProgressIndicator] as
  /// children. The icon is colored teal and is 75px in size. The
  /// [LinearProgressIndicator] is 5px in height and 100px in width, and is
  /// also colored teal. The [LinearProgressIndicator] is used to create a
  /// loading animation while the app is loading.
  ///
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.terminal,
              color: Colors.teal.shade100,
              size: 75,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 5,
                width: 100,
                child: LinearProgressIndicator(
                  color: Colors.teal.shade800,
                )),
          ],
        ),
      ),
    );
  }
}
