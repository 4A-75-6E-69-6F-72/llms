import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/controllers/edit_payment_form_controller.dart';
import 'package:llms/controllers/edit_tenant_form_controller.dart';
import 'package:llms/controllers/search_bar_controller.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/helpers/helper.dart';
import 'package:llms/helpers/sql_manager.dart';
import 'package:llms/views/components/custom_icon.dart';
import 'package:llms/views/components/item_widget.dart';

class TenantMain extends StatelessWidget {
  Function onEdit;
  Function refresh;
  TenantMain(
      {required this.onEdit,
      required this.items,
      super.key,
      required this.refresh});

  List<Map> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Helper.getContextWidth(context),
      height: Helper.getContextHeigth(context),
      margin: EdgeInsets.only(
          right: Config.horizontalPageMargin,
          left: Config.horizontalPageMargin,
          top: Config.topPageMargin,
          bottom: Config.menuHeight + Config.bottomPageMargin),
      // color: Config.primaryColor,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        getTitle(),
        Helper.getVerticalSpace(20),
        getSearchSection(),
        Helper.getVerticalSpace(15),
        getItemsSection(context),
      ]),
    );
  }

  Widget getTitle() {
    return Helper.getText(
        content: "Tenants", fontSize: 21, fontWeight: FontWeight.bold);
  }

  Widget getSearchSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // test
      children: [getSearchBar()],
      // children: [getSearchBar(), getFilterIcon()],
    );
  }

  Widget getSearchBar() {
    return SearchBarController(placeholder: "search tenants");
  }

  Widget getFilterIcon() {
    return CustomIcon(iconData: Icons.filter_list_rounded);
  }

  Widget getItemsSection(BuildContext context) {
    return Expanded(
        child: Container(
      child: SingleChildScrollView(
          child: Column(
        children: [...getItemsWidgets(context), Helper.getVerticalSpace(40)],
      )),
    ));
  }

  List<Widget> getItemsWidgets(BuildContext context) {
    List<Widget> itemsWidgets = [];
    for (Map item in items) {
      item["onTap"] = () {
        print("edit");
        SqlManager.getItemById(item["id"], "Tenant").then((List<Map> response) {
          // the initial map is read only, this removes that constraint
          Map tenantMap = {...response[0]};
          onEdit(EditTenantFormController(
            tenant: tenantMap,
            refresh: () async {
              await refresh();
            },
          ));
          Helper.openDrawer(context);
        });
      };
      itemsWidgets.add(getItemWidget(item));
    }
    return itemsWidgets;
  }

  Widget getItemWidget(item) {
    return ItemWidget(item: item);
  }
}
