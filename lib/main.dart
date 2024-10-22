import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'pages/splash_screen.dart';
import 'utils/theme.dart';

/// The main entrypoint for the application.
///
/// On the web, this enables the path URL strategy, which is the default
/// strategy used by Flutter web apps. This allows URLs to be deep-linked
/// into the app, and allows the app to be indexed by search engines.
///
/// On other platforms, this simply runs the app.
void main() {
  if (kIsWeb) {
    usePathUrlStrategy();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  /// Build a [MaterialApp] that displays the splash screen and uses a dark theme
  /// regardless of the user's system settings.
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const SplashScreen(),
    );
  }
}
