import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  double letterSpacing;
  double wordSpacing;
  final String text;
  final Color color;
  AppText({
    Key? key,
    this.size = 18,
    this.letterSpacing = 0.5,
    this.wordSpacing = 0.5,
    required this.text,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: color,
        fontFamily: 'nunito sans',
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        fontSize: size,
      ),
    );
  }
}
