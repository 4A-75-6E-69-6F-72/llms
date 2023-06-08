import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/views/components/custom_text_field.dart';

class CustomDateField extends StatelessWidget {
  const CustomDateField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        getYearField(),
        getSpace(1),
        getMonthField(),
        getSpace(1),
        getDayField()
      ],
    );
  }

  Widget getYearField() {
    return Flexible(
      child: CustomTextField(value: "", onChange: () {}, placeholder: "year"),
      flex: 10,
    );
  }

  Widget getMonthField() {
    return Flexible(
      child: CustomTextField(value: "", onChange: () {}, placeholder: "month"),
      flex: 10,
    );
  }

  Widget getDayField() {
    return Flexible(
      child: CustomTextField(value: "", onChange: () {}, placeholder: "day"),
      flex: 10,
    );
  }

  Widget getSpace(int flex) {
    return Flexible(
      child: Container(),
      flex: flex,
    );
  }
}
