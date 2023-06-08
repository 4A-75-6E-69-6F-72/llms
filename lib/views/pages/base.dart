import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/controllers/add_payment_form_controller.dart';
import 'package:llms/controllers/add_service_form_controller.dart';
import 'package:llms/controllers/add_tenant_form_controller.dart';
import 'package:llms/controllers/edit_payment_form_controller.dart';
import 'package:llms/controllers/payment_main_controller.dart';
import 'package:llms/controllers/service_main_controller.dart';
import 'package:llms/controllers/tenant_main_controller.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/helpers/helper.dart';
import 'package:llms/views/components/custom_container.dart';

class Base extends StatelessWidget {
  String state;
  BuildContext parentContext;
  TabController tabController;
  Widget drawerWidget;
  Function setDrawerWidget;
  Function refresh;
  Base(
      {this.state = "payment",
      required this.refresh,
      required this.drawerWidget,
      required this.setDrawerWidget,
      required this.parentContext,
      required this.tabController,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      onDrawerChanged: (isOpened) {
        refresh();
      },
      resizeToAvoidBottomInset: true,
      backgroundColor: Config.whiteColor,
      drawer: Drawer(
        width: Helper.getContextWidth(context),
        child: drawerWidget,
      ),
      bottomSheet: Container(
        height: 0,
      ),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        getMainWidget(context),
        getBottomMenu(context),
        getAddButton(context),
      ]),
    );
  }

  Widget getMainWidget(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: tabController,
      children: [
        getPaymentMainWidget(context),
        getTenantsMainWidget(context),
        Icon(Icons.directions_transit),
        getServicesMainWidget(),
        Icon(Icons.motorcycle),
      ],
    );
//     switch (state) {
//       case "payments":
//         return getPaymentsMainWidget();

//       case "tenants":
//         return getTenantsMainWidget();

// // case "services"
//       default:
//         return getServicesMainWidget();
//     }
  }

  Widget getPaymentMainWidget(BuildContext context) {
    Function onEdit = (editPage) {
      setDrawerWidget(editPage);
    };
    return PaymentMainController(onEdit: (editPage) {
      onEdit.call(editPage);
    });
  }

  Widget getPaymentsMainWidget() {
    return Container();
  }

  Widget getTenantsMainWidget(BuildContext context) {
    Function onEdit = (editPage) {
      setDrawerWidget(editPage);
    };

    var controller = TenantMainController(onEdit: (editPage) {
      onEdit.call(editPage);
    });
    return controller;
  }

  Widget getServicesMainWidget() {
    Function onEdit = (editPage) {
      setDrawerWidget(editPage);
    };
    return ServiceMainController(onEdit: (editPage) {
      onEdit.call(editPage);
    });
  }

  Widget getAddButton(BuildContext context) {
    // double buttonHeight = 50;
    double buttonWidth =
        Helper.getContextFractionalWidth(context, Config.addButtonWidthRatio);
    return Builder(builder: ((context) {
      return InkWell(
        onTap: () {
          addItem(context);
        },
        child: Container(
          width: buttonWidth,
          height: buttonWidth,
          margin:
              EdgeInsets.only(bottom: Config.menuHeight - (buttonWidth / 2)),
          decoration: BoxDecoration(
              color: Config.primaryColor,
              image: DecorationImage(
                  image: AssetImage(Config.baseImagePath + "/add_icon.png")),
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: [getAddButtonShadow()]),
        ),
      );
    }));

    // CustomContainer(
    //   backgroundColor: Config.primaryColor,
    //   backgroundImage: AssetImage(Config.baseImagePath + "/add_icon.png"),
    //   margin: EdgeInsets.only(bottom: Config.menuHeight - (buttonHeight / 2)),
    //   width: buttonHeight,
    //   height: buttonWidth,
    // );
  }

  void addItem(BuildContext context) {
    print("add item");
    setDrawerWidget(getCurrentAddForm());
    Helper.openDrawer(context);

    // setDrawerWidget(EditPaymentFormController(payment: {}));
    // Helper.openDrawer(parentContext);
  }

  getCurrentAddForm() {
    switch (state) {
      case "payment":
        print("go to add payment");
        return AddPaymentFormController();
      case "tenant":
        print("go to add tenant");
        return AddTenantFormController();
      case "service":
        print("go to add service");
        return AddServiceFormController();
    }
  }

  BoxShadow getAddButtonShadow() {
    return BoxShadow(
        color: Colors.black.withOpacity(0.25),
        blurRadius: 10,
        spreadRadius: 0,
        offset: Offset(0, 3));
  }

  Widget getBottomMenu(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [getBottomImage(), getNavButtons()],
    );
  }

  Widget getBottomImage() {
    double width = Helper.getContextWidth(parentContext);
    // double height = Helper.getContextFractionalHeight(
    //     parentContext, Config.menuHeightRatio);

    double imageWidth = 492;
    double imageHeight = 97;

    double imageRatio = imageWidth / imageHeight;
    Config.menuHeight = width / imageRatio;

    return AspectRatio(
      aspectRatio: imageRatio,
      child: CustomContainer(
        // height: height,
        width: width,
        backgroundImage: AssetImage(Config.baseImagePath + "/menu_image.png"),
        // imageFit: getAppropriateFit(width, height),
      ),
    );
  }

  Widget getNavButtons() {
    return TabBar(
      controller: tabController,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: [
        Tab(
          child: getPaymentIcon(),
        ),
        Tab(
          child: getTenantIcon(),
        ),
        Tab(
          child: getEmptyIcon(),
        ),
        Tab(child: getServiceIcon()),
        Tab(
          child: getHelpIcon(),
        )
      ],
    );
  }

  Widget getPaymentIcon() {
    return getIcon("/payment_icon.png");
  }

  Widget getTenantIcon() {
    return getIcon("/tenant_icon.png");
  }

  Widget getServiceIcon() {
    return getIcon("/service_icon.png");
  }

  Widget getHelpIcon() {
    return getIcon("/help_image.png");
  }

  Widget getEmptyIcon() {
    return CustomContainer(
      width: 25,
      height: 25,
    );
  }

  Widget getIcon(String iconPath, {EdgeInsets? margin}) {
    return CustomContainer(
      margin: margin,
      width: 25,
      height: 25,
      backgroundImage: AssetImage(Config.baseImagePath + iconPath),
    );
  }

  // BoxFit getAppropriateFit(double containerWidth, double containerHeight) {
  //   double imageWidth = 492;
  //   double imageHeight = 97;

  //   double imageRatio = imageWidth / imageHeight;

  //   double containerRatio = containerWidth / containerWidth;

  //   if (imageRatio > containerRatio) {
  //     return BoxFit.fitWidth;
  //   } else {
  //     return BoxFit.fitWidth;
  //   }
  // }
}
