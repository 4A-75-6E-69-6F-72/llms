import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/helpers/helper.dart';

class FieldText extends StatelessWidget {
  String helperText;
  bool required;
  FieldText({required this.helperText, required this.required, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [getFieldLabel(), getLabelStar()],
      ),
      margin: EdgeInsets.only(left: 15, bottom: 5),
    );
    ;
  }

  Widget getFieldLabel() {
    return Helper.getText(content: helperText, fontWeight: FontWeight.w400);
  }

  Widget getLabelStar() {
    if (required) {
      return Helper.getText(
          content: "*", fontWeight: FontWeight.w400, color: Config.redColor);
    } else {
      return Container();
    }
  }
}
