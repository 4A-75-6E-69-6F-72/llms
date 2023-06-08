import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/repository/items.dart';
import 'package:llms/views/pages/payment_main.dart';

class PaymentMainController extends StatefulWidget {
  Function onEdit;
  PaymentMainController({required this.onEdit, super.key});

  @override
  State<PaymentMainController> createState() => _PaymentMainControllerState();
}

class _PaymentMainControllerState extends State<PaymentMainController> {
  List<Map> items = [];
  @override
  void initState() {
    items = getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PaymentMain(
      onEdit: (editPage) {
        widget.onEdit.call(editPage);
      },
      items: items,
    );
  }
}
