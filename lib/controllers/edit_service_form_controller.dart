import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/views/pages/payment_form.dart';
import 'package:llms/views/pages/service_form.dart';

class EditServiceFormController extends StatefulWidget {
  Map service;
  EditServiceFormController({required this.service, super.key});

  @override
  State<EditServiceFormController> createState() =>
      _EditServiceFormControllerState();
}

class _EditServiceFormControllerState extends State<EditServiceFormController> {
  @override
  Widget build(BuildContext context) {
    return ServiceForm(
      service: widget.service,
      title: "Edit service",
      onSubmit: () {},
    );
  }
}
