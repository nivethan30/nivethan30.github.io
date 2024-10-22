import 'package:auto_size_text/auto_size_text.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/constants.dart';
import '../utils/responsive.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  /// Builds the about page widget with a photo, a header with the text
  /// "About Me", a divider, a text that describes the person, a list of
  /// skills and a photo on the right side if the device is a desktop.
  ///
  /// The photo is a CircleAvatar with a elevation of 8.0 and a radius of
  /// 100. The photo is centered if the device is a mobile device.
  ///
  /// The header is a Row with a Text with the text "About Me" and a
  /// Divider.
  ///
  /// The text is an AutoSizeText that displays a description of the
  /// person. The text is centered if the device is a mobile device.
  ///
  /// The list of skills is a Wrap with a list of skillCard widgets. Each
  /// skillCard widget displays a title and a SvgPicture of the skill.
  ///
  /// The photo on the right side is an imageStack widget that displays a
  /// stack of images. The images are the same as the ones in the
  /// skillCard widgets.
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    'About Me',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              if (!Responsive.isDesktop(context))
                Center(
                  child: AvatarGlow(
                    glowRadiusFactor: 0.3,
                    child: Material(
                      elevation: 8.0,
                      shape: const CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        radius: 100,
                        backgroundImage: const AssetImage(Assets.photo),
                      ),
                    ),
                  ),
                ),
              if (!Responsive.isDesktop(context))
                const SizedBox(
                  height: 50,
                ),
              const AutoSizeText(
                "Hello! I'm Arun Nivethan, a Flutter Developer based in Tamil Nadu, IN.\n\nI love building interactive and responsive applications that run smoothly on both iOS and Android. My focus is on delivering pixel-perfect designs and high-performance user experiences.\n\n",
              ),
              const AutoSizeText(
                "With one year of experience as a Flutter developer, I have worked on a variety of interesting projects that have helped me refine my skills. I am currently seeking new opportunities to further my career in mobile development.\n\n",
              ),
              const AutoSizeText(
                  "Here are a few technologies I've been working with recently:\n"),
              Wrap(
                runSpacing: 20,
                spacing: 20,
                children: [
                  skillCard(title: 'Flutter', pictureData: Assets.flutterLogo),
                  skillCard(title: 'Dart', pictureData: Assets.dartLogo),
                  skillCard(
                      title: 'Javascript', pictureData: Assets.javascriptLogo),
                  skillCard(title: 'Node.js', pictureData: Assets.nodejsLogo),
                  skillCard(title: 'Mysql', pictureData: Assets.mysqlLogo),
                  skillCard(title: 'MongoDB', pictureData: Assets.mongoDbLogo),
                ],
              )
            ],
          ),
        ),
        const SizedBox(width: 10),
        if (Responsive.isDesktop(context))
          Expanded(
            flex: 3,
            child: imageStack(),
          )
      ],
    );
  }

  /// Returns a Column widget containing an SvgPicture and a Text widget.
  /// The SvgPicture is used to display a logo, and the Text widget is used to
  /// display the title of the skill. The width and height of the SvgPicture are
  /// set to 75.
  Widget skillCard({required String title, required String pictureData}) {
    return Column(
      children: [
        SvgPicture.asset(
          pictureData,
          width: 75,
          height: 75,
        ),
        Text(title)
      ],
    );
  }
}

  /// Returns a Stack widget containing two Container widgets. The first
  /// container has a height and width of 400 and a teal border with a width
  /// of 4. The second container has a height and width of 400, a margin of 20
  /// on all sides, and a decoration of a BoxFit.cover of the photo image.
  /// The stack is aligned to the bottom end, so the second container is
  /// positioned at the bottom right of the first container.
Widget imageStack() {
  return Stack(
    alignment: AlignmentDirectional.bottomEnd,
    children: [
      Container(
        height: 400,
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal.shade100, width: 4),
        ),
      ),
      Container(
        height: 400,
        width: 300,
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(Assets.photo))),
      )
    ],
  );
}
