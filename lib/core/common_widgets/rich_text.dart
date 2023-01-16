import 'package:flutter/material.dart';

class RichTextScreen extends StatelessWidget {
  final String? text;
  final String? text1;
  final String? text2;
  final double? fontSize;
  final TextStyle? textStyle;

  const RichTextScreen(
      {Key? key,
      this.text,
      this.text1,
      this.text2,
      this.textStyle,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: text ?? '',
                style: TextStyle(
                  fontSize: fontSize ?? 25,
                  fontWeight: FontWeight.w500,
                  // height: 1.5,
                  color: const Color(0xff252B5C),
                ),
              ),
              TextSpan(
                text: text1 ?? '',
                style: textStyle ??
                    TextStyle(
                      fontSize: fontSize ?? 25,
                      fontWeight: FontWeight.bold,
                      // height: 1.5,
                      color: const Color(0xff252B5C),
                    ),
              ),
              TextSpan(
                text: text2 ?? '',
                style: textStyle ??
                    TextStyle(
                      color: const Color(0xff53587A),
                      height: 1.5,
                      fontWeight: FontWeight.normal,
                      fontSize: fontSize ?? 12,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
