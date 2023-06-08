import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/controllers/purpose_field_controller.dart';
import 'package:llms/views/pages/payment_form.dart';

class EditPaymentFormController extends StatefulWidget {
  Map payment;
  EditPaymentFormController({required this.payment, super.key});

  @override
  State<EditPaymentFormController> createState() =>
      _EditPaymentFormControllerState();
}

class _EditPaymentFormControllerState extends State<EditPaymentFormController> {
  final _formKey = GlobalKey<FormState>();
  PurposeFieldController purposeFieldController = PurposeFieldController();
  @override
  Widget build(BuildContext context) {
    return PaymentForm(
      purposeFieldController: purposeFieldController,
      formKey: _formKey,
      payment: widget.payment,
      title: "Edit payment",
      onSubmit: () {},
    );
  }
}
