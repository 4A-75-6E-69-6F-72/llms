import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/helpers/helper.dart';
import 'package:llms/models/custom_duration.dart';
import 'package:llms/models/purpose.dart';
import 'package:llms/views/components/custom_container.dart';

class PurposeWidget extends StatelessWidget {
  Purpose content;
  double fontSize = 11;
  Function onTap;
  PurposeWidget({required this.content, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: () {
        onTap();
      },
      borderRadius: 20,
      backgroundColor: Config.primaryColor.withOpacity(0.09),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getLeftSection(),
          getRightSection(),
        ],
      ),
    );
  }

  Widget getLeftSection() {
    return Row(
      children: [
        getServiceLabel(),
        getSeparatorLabel(),
        getDurationLabel(),
      ],
    );
  }

  Widget getRightSection() {
    return Row(
      children: [Helper.getHorizontalSpace(3), getCloseIcon()],
    );
  }

  Widget getServiceLabel() {
    return Helper.getText(
        content: content.service!.name!,
        color: Config.primaryColor,
        fontSize: fontSize);
  }

  Widget getSeparatorLabel() {
    return Helper.getText(
        content: " - ", color: Config.primaryColor, fontSize: fontSize);
  }

  Widget getDurationLabel() {
    return Helper.getText(
        content: getDuration(), color: Config.primaryColor, fontSize: fontSize);
  }

  Widget getCloseIcon() {
    return Icon(
      Icons.close,
      size: fontSize,
      color: Config.blackColor,
    );
  }

  String getDuration() {
    CustomDuration? customDuration = content.service!.duration;

    if (customDuration == null) {
      if (content.unit == 1) {
        return "1 month";
      } else {
        return "${content.unit} months";
      }
    }

    int days = getDurationInDays(customDuration);
    if (days == 1) {
      return "1 day";
    } else if (days < 7) {
      return "$days days";
    } else if (days >= 7 && days < 14) {
      return "1 week";
    } else if (days < 30) {
      return "${days / 7} weeks";
    } else if (days < 60 && days >= 30) {
      return "1 month";
    } else if (days < 365) {
      return "${days / 30} months";
    } else if (days >= 365 && days < 730) {
      return "1 year";
    } else {
      return "${days / 365} years";
    }
  }

  int getDurationInDays(CustomDuration customDuration) {
    int days = customDuration.day;
    days += customDuration.month * 30;
    days += customDuration.year * 365;
    return days;
  }
}
