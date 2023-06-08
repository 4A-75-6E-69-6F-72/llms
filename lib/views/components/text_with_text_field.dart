import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/views/components/custom_text_field.dart';
import 'package:llms/views/components/field_text.dart';

class TextWithTextField extends StatelessWidget {
  String helperText;
  bool required;
  String value;
  Function onChange;
  String placeholder;
  int maxLines;
  bool isInt;
  int? maxLength;
  String? Function(String?)? validator;
  TextWithTextField(
      {this.validator,
      required this.helperText,
      required this.required,
      required this.value,
      required this.onChange,
      required this.placeholder,
      this.isInt = false,
      this.maxLength,
      this.maxLines = 1,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldText(helperText: helperText, required: required),
        CustomTextField(
            validator: validator,
            isInt: isInt,
            maxLength: maxLength,
            maxLines: maxLines,
            value: value,
            onChange: onChange,
            placeholder: placeholder),
      ],
    );
  }
}
