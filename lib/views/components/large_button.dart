import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/helpers/helper.dart';

class LargeButton extends StatelessWidget {
  String text;
  Function onTap;
  LargeButton({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Config.primaryColor)),
      child:
          Helper.getText(content: text, color: Config.whiteColor, fontSize: 17),
    );
  }
}
