import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/views/components/custom_date_field.dart';
import 'package:llms/views/components/custom_drop_down_field.dart';
import 'package:llms/views/components/field_text.dart';

class TextWithDateField extends StatelessWidget {
  String helperText;
  bool required;
  String placeholder;
  String value;
  Function onChange;
  TextWithDateField(
      {required this.helperText,
      required this.required,
      required this.placeholder,
      required this.value,
      required this.onChange,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldText(helperText: helperText, required: required),
        CustomDateField()
      ],
    );
    ;
  }
}
