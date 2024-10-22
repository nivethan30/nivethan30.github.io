import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import '../pages/about.dart';
import '../pages/experience.dart';
import '../pages/homepage.dart';
import '../pages/work.dart';
import '../widgets/appbar.dart';
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
  void initState() {
    super.initState();
    keys = [homeKey, aboutKey, experienceKey, workKey, contactKey];
  }

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

  ListTile drawerListTile(
      {required String title, required VoidCallback onTap}) {
    return ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.teal.shade100),
        ),
        onTap: onTap);
  }

  void closeDrawer() {
    _mainScaffoldKey.currentState?.closeEndDrawer();
  }
}
