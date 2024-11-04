import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import '../pages/about.dart';
import '../pages/experience.dart';
import '../pages/homepage.dart';
import '../pages/work.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer_list_tile.dart';
import '../widgets/social_widgets.dart';
import 'contact.dart';

final GlobalKey<ScaffoldState> _mainScaffoldKey = GlobalKey<ScaffoldState>();

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey workKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  late final List<GlobalKey> keys;

  @override
  /// Initialize the state of the widget.
  ///
  /// This function is called when the widget is inserted into the tree.
  ///
  /// It initializes the list of keys for the sections of the page.
  void initState() {
    super.initState();
    keys = [homeKey, aboutKey, experienceKey, workKey, contactKey];
  }

  /// Scroll to the section with the given key.
  ///
  /// This function is called by [AppBar] when a section is tapped.
  ///
  /// It uses [Scrollable.ensureVisible] to scroll to the section with the given
  /// [key]. If the [key] is not currently visible, it is logged to the console.
  ///
  /// The scroll animation has a duration of 500 milliseconds and uses the
  /// [Curves.easeInOut] curve.
  void _scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      debugPrint('Key context is null for: ${key.toString()}');
    }
  }

  @override

  /// Builds the main page scaffold with app bar, end drawer, and body content.
  ///
  /// The app bar contains a [AppBarWidget] with a handler for the onPressed event
  /// that scrolls to the section corresponding to the selected value. It also
  /// includes a button to open the end drawer.
  ///
  /// The end drawer displays the navigation links for different sections of the page.
  ///
  /// The body displays the main content of the page.
  Widget build(BuildContext context) {
    return Scaffold(
        key: _mainScaffoldKey,
        appBar: AppBarWidget(
          onPressed: (value) {
            _scrollToSection(keys[value]);
          },
          openDrawer: () {
            _mainScaffoldKey.currentState?.openEndDrawer();
          },
        ),
        endDrawer: navigationDrawer(),
        body: _bodyContent());
  }

  /// Builds the main content of the page, including sections for the home page, about page, experience page, work page, and contact page.
  /// The content is displayed within a Row widget, with the main sections wrapped in Containers and displayed within a SingleChildScrollView.
  /// The function also handles responsive design, such as displaying a social widget on desktop screens and rotating email contact information.
  Widget _bodyContent() {
    double scHeight = MediaQuery.sizeOf(context).height;
    return Row(
      children: [
        if (Responsive.isDesktop(context)) socialWidget(),
        Expanded(
          flex: 10,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: scHeight - kToolbarHeight,
                  width: double.infinity,
                  key: homeKey,
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: FadeInUp(
                    duration: const Duration(seconds: 1),
                    child: HomePage(
                      onContactPressed: () {
                        _scrollToSection(contactKey);
                      },
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  key: aboutKey,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: const AboutPage(),
                ),
                Container(
                  key: experienceKey,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: const ExperiencePage(),
                ),
                Container(
                  key: workKey,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: const WorkPage(),
                ),
                Container(
                  height: scHeight - kTextTabBarHeight,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  key: contactKey,
                  child: const ContactPage(),
                )
              ],
            ),
          ),
        ),
        if (Responsive.isDesktop(context))
          const Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RotatedBox(
                  quarterTurns: 45,
                  child: Text(
                    'arunnivethan435@gmail.com',
                    style: TextStyle(letterSpacing: 1.8),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: VerticalDivider(width: 2),
                ),
              ],
            ),
          ),
      ],
    );
  }

  /// Builds and returns a Drawer widget for the navigation menu.
  ///
  /// The Drawer widget has a background color of 0xFF0a192f and a width of 300.
  /// It contains a ListView with a list of ListTile widgets, each representing a navigation item.
  /// Each ListTile has an IconButton as its leading widget with an icon to close the drawer.
  /// The navigation items include 'Home', 'About', 'Experience', 'Work', and 'Contact'.
  /// Tapping on each item scrolls to the corresponding section and closes the drawer.
  Drawer navigationDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFF0a192f),
      width: 300,
      child: ListView(
        children: [
          ListTile(
            leading: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.teal.shade100,
                ),
                onPressed: () {
                  closeDrawer();
                }),
          ),
          drawerListTile(
              title: 'Home',
              onTap: () {
                _scrollToSection(homeKey);
                closeDrawer();
              }),
          drawerListTile(
              title: 'About',
              onTap: () {
                _scrollToSection(aboutKey);
                closeDrawer();
              }),
          drawerListTile(
              title: 'Experience',
              onTap: () {
                _scrollToSection(experienceKey);
                closeDrawer();
              }),
          drawerListTile(
              title: 'Work',
              onTap: () {
                _scrollToSection(workKey);
                closeDrawer();
              }),
          drawerListTile(
              title: 'Contact',
              onTap: () {
                _scrollToSection(contactKey);
                closeDrawer();
              }),
        ],
      ),
    );
  }

  /// Closes the end drawer of the main scaffold.
  ///
  /// This function is called when an item in the navigation drawer is tapped.
  /// It closes the end drawer by calling closeEndDrawer() on the state of the
  /// main scaffold, which is obtained using the key of the scaffold.
  void closeDrawer() {
    _mainScaffoldKey.currentState?.closeEndDrawer();
  }
}
