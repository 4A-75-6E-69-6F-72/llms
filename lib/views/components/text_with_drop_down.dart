import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/views/components/custom_drop_down_field.dart';
import 'package:llms/views/components/field_text.dart';

class TextWithDropDown extends StatelessWidget {
  String helperText;
  bool required;
  String placeholder;
  String value;
  List<String> items;
  Function onChange;
  String? Function(String?)? validator;

  TextWithDropDown(
      {this.validator,
      required this.helperText,
      required this.required,
      required this.placeholder,
      required this.value,
      required this.items,
      required this.onChange,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldText(helperText: helperText, required: required),
        CustomDropDownField(
            validator: validator,
            placeholder: placeholder,
            value: value,
            items: items,
            onChange: (newValue) {
              onChange(newValue);
            })
      ],
    );
    ;
  }
}
