import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/helpers/custom_navigator.dart';
import 'package:llms/helpers/helper.dart';

class CustomInfo extends StatelessWidget {
  Function onDelete;
  String message;
  CustomInfo({required this.message, required this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Container(
            width: Helper.getContextFractionalWidth(context, 0.9),
            height: Helper.getContextFractionalHeight(context, 0.35),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Config.whiteColor,
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getTitle(context),
                  Helper.getVerticalSpace(20),
                  getOkButton(context)
                ]),
          )),
    );
  }

  Widget getTitle(BuildContext context) {
    return Container(
        width: Helper.getContextFractionalWidth(context, 0.8),
        child: Helper.getText(
            fontWeight: FontWeight.bold,
            color: Config.blackColor,
            alignment: TextAlign.center,
            fontSize: 15,
            content: message));
  }

  Widget getOkButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        CustomNavigator.pop(context);
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(width: 1, color: Config.primaryColor),
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Helper.getText(content: "Ok", color: Config.primaryColor),
      ),
    );
  }
}
