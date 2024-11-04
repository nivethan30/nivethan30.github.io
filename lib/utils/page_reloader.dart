// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

/// Reloads the current page.
///
/// This is a web-specific function that should only be used when running
/// in a web environment. It will not work when running on mobile or desktop
/// platforms.
void reloadPage() {
  html.window.location.reload();
}