import 'package:auto_size_text/auto_size_text.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/constants.dart';
import '../utils/responsive.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
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
