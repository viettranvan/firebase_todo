import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_todo/utils/utils.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlutterLogo(size: 125),
        const SizedBox(height: 10.0),
        AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TyperAnimatedText("Todo App", textStyle: kAppTitle)
          ],
        ),
      ],
    );
  }
}
