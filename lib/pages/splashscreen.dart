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
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      _navigate();
    });
  }

  void _navigate() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MainPage()));
  }

  @override
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
