import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/repository/items.dart';
import 'package:llms/views/pages/payment_main.dart';
import 'package:llms/views/pages/tanant_main.dart';

class TenantMainController extends StatefulWidget {
  Function onEdit;
  TenantMainController({required this.onEdit, super.key});

  @override
  State<TenantMainController> createState() => _TenantMainControllerState();
}

class _TenantMainControllerState extends State<TenantMainController> {
  List<Map> items = [];
  @override
  void initState() {
    initItems();
    super.initState();
  }

  initItems() async {
    items = await getTenantItems();
  }

  @override
  Widget build(BuildContext context) {
    return TenantMain(
      onEdit: (editPage) {
        widget.onEdit.call(editPage);
      },
      refresh: () async {
        await refresh();
      },
      items: items,
    );
  }

  refresh() async {
    var newItems = await getTenantItems();
    setState(() {
      items = newItems;
    });
  }
}
