import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/helpers/designer.dart';
import 'package:llms/helpers/helper.dart';

class SearchBar extends StatelessWidget {
  String hintText;
  SearchBar({required this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config.searchSectionHeight,
      // test
      // This field should authomatically adjust to the screen size
      width: Helper.getContextFractionalWidth(context, 0.87),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Config.whiteColor,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 8,
                spreadRadius: 0,
                offset: Offset(0, 3))
          ]),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: Designer.getTextStyle(15, Config.blackColor, FontWeight.normal),
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.only(left: 20),
            hintStyle:
                Designer.getTextStyle(15, Config.greyColor, FontWeight.normal),
            border: getBorder(),
            enabledBorder: getBorder(),
            focusedBorder: getBorder(),
            errorBorder: getBorder(),
            disabledBorder: getBorder()),
      ),
    );
  }

  InputBorder getBorder() {
    return const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Config.blackColor),
        borderRadius: BorderRadius.all(Radius.circular(30)));
  }
}
