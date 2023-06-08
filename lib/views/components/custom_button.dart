import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/helpers/helper.dart';

class CustomButton extends StatelessWidget {
  Color backgroundColor;
  Color fontColor;
  double fontSize;
  String content;
  Function onTap;
  CustomButton(
      {required this.backgroundColor,
      required this.fontColor,
      required this.onTap,
      required this.content,
      required this.fontSize,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor)),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: Helper.getText(
                content: content, fontSize: fontSize, color: fontColor)));
  }
}
