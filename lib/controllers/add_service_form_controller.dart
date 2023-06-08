import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/views/pages/payment_form.dart';
import 'package:llms/views/pages/service_form.dart';

class AddServiceFormController extends StatelessWidget {
  const AddServiceFormController({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceForm(
        title: "Add Service", onSubmit: onSubmit, showDeleteIcon: false);
  }

  onSubmit() {}
}
