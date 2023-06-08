import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/controllers/purpose_field_controller.dart';
import 'package:llms/views/pages/payment_form.dart';

class AddPaymentFormController extends StatelessWidget {
  AddPaymentFormController({super.key});

  final _formKey = GlobalKey<FormState>();
  PurposeFieldController purposeFieldController = PurposeFieldController();

  @override
  Widget build(BuildContext context) {
    return PaymentForm(
        purposeFieldController: purposeFieldController,
        formKey: _formKey,
        title: "Add payment",
        onSubmit: onSubmit,
        showDeleteIcon: false);
  }

  onSubmit() {
    if (_formKey.currentState!.validate() &&
        purposeFieldController.validate()) {
      print("save");
      // SqlManager.savePayment();
    }
  }
}
