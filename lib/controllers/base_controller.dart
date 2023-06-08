import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/helpers/custom_navigator.dart';
import 'package:llms/helpers/helper.dart';
import 'package:llms/views/pages/base.dart';

class BaseController extends StatefulWidget {
  const BaseController({super.key});

  @override
  State<BaseController> createState() => _BaseControllerState();
}

class _BaseControllerState extends State<BaseController>
    with TickerProviderStateMixin {
  String state = "payment";
  late TabController tabController;
  Widget drawerWidget = Container();

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 5);
    tabController.addListener(onTap);
  }

  @override
  Widget build(BuildContext context) {
    return Base(
      state: state,
      refresh: () {
        print("refresh base pane");
        setState(() {});
      },
      parentContext: context,
      tabController: tabController,
      drawerWidget: drawerWidget,
      setDrawerWidget: (newDrawerWidget) {
        setState(() {
          drawerWidget = newDrawerWidget;
        });
      },
    );
  }

  onTap() {
    if (tabController.index == 0) {
      setState(() {
        state = "payment";
      });
    } else if (tabController.index == 1) {
      setState(() {
        state = "tenant";
      });
    } else if (tabController.index == 2) {
      tabController.index = tabController.previousIndex;
    } else if (tabController.index == 3) {
      setState(() {
        state = "service";
      });
    } else if (tabController.index == 4) {
      tabController.index = tabController.previousIndex;
      displayHintModal();
    }
  }

  void displayHintModal() {
    Helper.showCustomInformationDialog(
        context: context,
        message: getHelperMessage(),
        onCancel: () {
          CustomNavigator.pop(context);
        });
  }

  String getHelperMessage() {
    return "The main features of this application are: \n 1. Manage tenants \n 2. Manage paid services associated with property management \n 3. Manage the payments made by tenants, either through mobile money or face to face";
  }
}
