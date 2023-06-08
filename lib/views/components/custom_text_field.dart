import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/helpers/designer.dart';
import 'package:llms/helpers/helper.dart';

class CustomTextField extends StatelessWidget {
  String value;
  String placeholder;
  Function onChange;
  bool isInt;
  int maxLines;
  int? maxLength;
  String? Function(String?)? validator;

  CustomTextField(
      {required this.value,
      required this.onChange,
      required this.placeholder,
      this.validator,
      this.maxLines = 1,
      this.maxLength,
      this.isInt = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return getField();
  }

  Widget getField() {
    return TextFormField(
      validator: validator,
      maxLines: maxLines,
      initialValue: value,
      onChanged: (value) {
        onChange(value);
      },
      inputFormatters: getInputFormatters(),
      style: Designer.getTextStyle(null, Config.blackColor, null),
      decoration: InputDecoration(
        contentPadding: getContentPadding(),
        hintStyle: Designer.getTextStyle(null, Config.greyColor, null),
        border: getBorder(),
        errorBorder: getBorder(),
        enabledBorder: getBorder(),
        disabledBorder: getBorder(),
        hintText: placeholder,
      ),
    );
  }

  EdgeInsets getContentPadding() {
    if (maxLines < 2) {
      return EdgeInsets.symmetric(horizontal: 20);
    } else {
      return EdgeInsets.symmetric(horizontal: 20, vertical: 10);
    }
  }

  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Config.blackColor));
  }

  List<TextInputFormatter>? getInputFormatters() {
    List<TextInputFormatter> formatters = [];
    if (isInt) {
      formatters.add(TextInputFormatter.withFunction((oldValue, newValue) {
        if (!Helper.isInt(newValue.text) && newValue.text.isNotEmpty) {
          return oldValue;
        }
        return newValue;
      }));
    }
    if (maxLength != null) {
      formatters.add(LengthLimitingTextInputFormatter(maxLength));
    }
    return formatters;
  }
}
