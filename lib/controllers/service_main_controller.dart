import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/repository/items.dart';
import 'package:llms/views/pages/payment_main.dart';
import 'package:llms/views/pages/service_main.dart';
import 'package:llms/views/pages/tanant_main.dart';

class ServiceMainController extends StatefulWidget {
  Function onEdit;
  ServiceMainController({required this.onEdit, super.key});

  @override
  State<ServiceMainController> createState() => _ServiceMainControllerState();
}

class _ServiceMainControllerState extends State<ServiceMainController> {
  List<Map> items = [];
  @override
  void initState() {
    items = getServiceItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ServiceMain(
      onEdit: (editPage) {
        widget.onEdit.call(editPage);
      },
      items: items,
    );
  }
}
