import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/helpers/custom_navigator.dart';
import 'package:llms/helpers/helper.dart';

class DeleteConfirmation extends StatelessWidget {
  Function onDelete;
  String message;
  DeleteConfirmation(
      {required this.message, required this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Container(
          width: Helper.getContextFractionalWidth(context, 0.9),
          height: Helper.getContextFractionalHeight(context, 0.23),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Config.whiteColor, borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            getTitle(context),
            Helper.getVerticalSpace(20),
            getButtons(context)
          ]),
        ));
  }

  Widget getTitle(BuildContext context) {
    return Container(
        width: Helper.getContextFractionalWidth(context, 0.7),
        child: Helper.getText(
            fontWeight: FontWeight.bold,
            alignment: TextAlign.center,
            fontSize: 15,
            content: message));
  }

  Widget getButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getYesButton(context),
        Helper.getHorizontalSpace(20),
        getNoButton(context)
      ],
    );
  }

  Widget getYesButton(BuildContext context) {
    return TextButton(
        onPressed: () {
          CustomNavigator.pop(context);
          CustomNavigator.pop(context);
          onDelete();
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
            backgroundColor: MaterialStateProperty.all(Config.primaryColor)),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Helper.getText(content: "Yes", color: Config.whiteColor),
        ));
  }

  Widget getNoButton(BuildContext context) {
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
        child: Helper.getText(content: "No", color: Config.primaryColor),
      ),
    );
  }
}
