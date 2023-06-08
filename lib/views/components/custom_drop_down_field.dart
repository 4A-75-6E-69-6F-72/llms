import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/helpers/helper.dart';
import 'package:llms/views/components/field_text.dart';

class CustomDropDownField extends StatelessWidget {
  CustomDropDownField(
      {required this.placeholder,
      required this.value,
      required this.items,
      required this.onChange,
      this.validator,
      super.key});

  String placeholder;
  String value;
  List<String> items;
  Function onChange;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    // String dropdownValue = value;
    return getField();
  }

  Widget getField() {
    return DropdownButtonFormField<String>(
        validator: validator,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20, right: 10),
            border: getBorder(),
            enabledBorder: getBorder()),
        value: value,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: getMenuItemWidget(value),
          );
        }).toList(),
        onChanged: (newValue) {
          onChange(newValue);
        });
  }

  Widget getMenuItemWidget(String value) {
    return Container(child: Helper.getText(content: value));
  }

  InputBorder getBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Config.blackColor));
  }
}
