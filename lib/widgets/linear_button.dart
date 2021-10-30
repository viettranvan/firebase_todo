import 'package:flutter/material.dart';
import 'package:firebase_todo/utils/utils.dart';

class LinearButton extends StatelessWidget {
  const LinearButton({
    Key? key,
    required this.color1,
    required this.color2,
    required this.buttonTitle,
    required this.onTap
  }) : super(key: key);

  final String buttonTitle;
  final Color color1;
  final Color color2;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              color1,
              color2,
            ],
          ),
        ),
        child: Center(
          child: Text(buttonTitle, style: kWhiteTextButton),
        ),
      ),
    );
  }
}
