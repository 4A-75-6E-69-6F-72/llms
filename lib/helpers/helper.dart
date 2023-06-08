import 'package:flutter/material.dart';
import 'package:llms/helpers/custom_navigator.dart';
import 'package:llms/helpers/designer.dart';
import 'package:llms/views/components/custom_container.dart';
import 'package:llms/views/pages/delete_confirmation.dart';
import 'package:llms/views/pages/custom_info.dart';
import 'package:intl/intl.dart';

class Helper {
  static double getContextFractionalHeight(
      BuildContext context, double heightRatio) {
    return MediaQuery.of(context).size.height * heightRatio;
  }

  static double getContextFractionalWidth(
      BuildContext context, double widthRatio) {
    return MediaQuery.of(context).size.width * widthRatio;
  }

  static double getContextWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getContextHeigth(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Text getText(
      {required String content,
      double? fontSize,
      Color? color,
      FontWeight? fontWeight,
      TextAlign? alignment,
      int? maxLines}) {
    return Text(
      content,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      maxLines: maxLines,
      textAlign: alignment,
      style: Designer.getTextStyle(fontSize, color, fontWeight),
    );
  }

  static getVerticalSpace(double space) {
    return SizedBox(
      height: space,
    );
  }

  static getHorizontalSpace(double space) {
    return SizedBox(
      width: space,
    );
  }

  static openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  static Widget getBackButton(BuildContext context) {
    return CustomContainer(
      child: Icon(Icons.arrow_back_rounded),
      onTap: () {
        CustomNavigator.pop(context);
      },
    );
  }

  static bool isInt(String toBeChecked) {
    try {
      int.parse(toBeChecked);
      return true;
    } catch (e) {
      return false;
    }
  }

  static showCustomConfirmationDialog(
      {required BuildContext context,
      required String message,
      required Function onConfirm,
      required Function onCancel}) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return DeleteConfirmation(
          message: message,
          onDelete: () {
            onConfirm();
          },
        );
        // return AlertDialog(
        //   // <-- SEE HERE
        //   // title: const Text('Cancel booking'),
        //   content: SingleChildScrollView(
        //     child: ListBody(
        //       children: <Widget>[
        //         Text(message),
        //       ],
        //     ),
        //   ),
        //   actions: <Widget>[
        //     TextButton(
        //       child: const Text('Cancel'),
        //       onPressed: () {
        //         onCancel();
        //       },
        //     ),
        //     TextButton(
        //       child: const Text('Confirm'),
        //       onPressed: () {
        //         onConfirm();
        //       },
        //     ),
        //   ],
        // );
      },
    );
  }

  static showCustomInformationDialog(
      {required BuildContext context,
      required String message,
      required Function onCancel}) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CustomInfo(
          message: message,
          onDelete: () {},
        );
      },
    );
  }

  static String? Function(String?)? getAmountValidator() {
    return (value) {
      print("validate amount");
      try {
        int amount = int.parse(value!);
        if (amount <= 0) {
          return "The amount must be greater than 0";
        }
      } catch (e) {
        return "invalid input for amount";
      }
      return null;
    };
  }

  static String? Function(String?)? getDropDownValidator(
      {required String defaultValue, required List<String> items}) {
    return (value) {
      print("validate drop down");
      if (value == defaultValue) {
        return "Please select an item";
      }
      if (!items.contains(value)) {
        return "invalid input";
      }
      return null;
    };
  }

  static getDisplayAmount(int amount) {
    final format = NumberFormat('#,###');
    return format.format(amount);
  }

  static removeLastCharacter(String str) {
    return str.substring(0, str.length - 1);
  }
}
