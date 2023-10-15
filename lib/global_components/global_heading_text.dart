import 'package:flutter/material.dart';

class GlobalHeadingText extends StatelessWidget {
  String text;
  TextStyle? style;

  GlobalHeadingText(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    style ??= const TextStyle();

    return Text(
      text,
      textAlign: TextAlign.left,
      style: style!.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}
