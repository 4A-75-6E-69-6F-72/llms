import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/controllers/edit_payment_form_controller.dart';
import 'package:llms/controllers/edit_service_form_controller.dart';
import 'package:llms/controllers/search_bar_controller.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/helpers/helper.dart';
import 'package:llms/views/components/custom_icon.dart';
import 'package:llms/views/components/item_widget.dart';

class ServiceMain extends StatelessWidget {
  Function onEdit;
  ServiceMain({required this.onEdit, required this.items, super.key});

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
        content: "Services", fontSize: 21, fontWeight: FontWeight.bold);
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
    return SearchBarController(
      placeholder: "search service",
    );
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
        onEdit(EditServiceFormController(service: item));
        Helper.openDrawer(context);
      };

      itemsWidgets.add(getItemWidget(item));
    }
    return itemsWidgets;
  }

  Widget getItemWidget(item) {
    return ItemWidget(item: item);
  }
}
