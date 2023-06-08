import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/controllers/purpose_field_controller.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/helpers/custom_navigator.dart';
import 'package:llms/helpers/helper.dart';
import 'package:llms/views/components/custom_drop_down_field.dart';
import 'package:llms/views/components/custom_icon.dart';
import 'package:llms/views/components/custom_text_field.dart';
import 'package:llms/views/components/large_button.dart';
import 'package:llms/views/components/text_with_drop_down.dart';
import 'package:llms/views/components/text_with_text_field.dart';

class PaymentForm extends StatelessWidget {
  Map? payment;
  String title;
  Function onSubmit;
  bool showDeleteIcon;

  PurposeFieldController purposeFieldController;
  final formKey;
  PaymentForm(
      {this.payment,
      required this.purposeFieldController,
      required this.formKey,
      required this.title,
      required this.onSubmit,
      this.showDeleteIcon = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Helper.getContextWidth(context),
        height: Helper.getContextHeigth(context),
        margin: EdgeInsets.only(
            left: Config.horizontalPageMargin,
            right: Config.horizontalPageMargin,
            top: 60),
        alignment: Alignment.center,
        child: Stack(
            alignment: Alignment.bottomCenter,
            children: [getUpperSection(context), getLowerSection(context)]));
  }

  Widget getUpperSection(BuildContext context) {
    return Container(
      width: Helper.getContextWidth(context),
      height: Helper.getContextHeigth(context),
      alignment: Alignment.topCenter,
      child: Column(children: [
        getEditPaymentHeader(context),
        getEditPaymentFormSection()
      ]),
    );
  }

  Widget getEditPaymentHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [getTextSection(context), getDeleteButton(context)],
    );
  }

  Widget getTextSection(BuildContext context) {
    return Row(
      children: [
        getBackButton(context),
        Helper.getHorizontalSpace(20),
        getTitle()
      ],
    );
  }

  Widget getBackButton(BuildContext context) {
    return Helper.getBackButton(context);
  }

  Widget getTitle() {
    return Helper.getText(
        content: title, fontSize: 18, fontWeight: FontWeight.bold);
  }

  Widget getDeleteButton(BuildContext context) {
    if (showDeleteIcon) {
      return CustomIcon(
          iconData: Icons.delete,
          onTap: () {
            Helper.showCustomConfirmationDialog(
                context: context,
                message: "Are you sure you want to delete this Payment?",
                onConfirm: () {
                  print("deletedItem");
                },
                onCancel: () {
                  CustomNavigator.pop(context);
                });
          });
    } else {
      return Container(
        height: Config.searchSectionHeight,
      );
    }
  }

  Widget getLowerSection(BuildContext context) {
    return Container(
        width: Helper.getContextWidth(context),
        height: Config.menuHeight,
        alignment: Alignment.center,
        child: getValidationButton());
  }

  Widget getValidationButton() {
    return Container(
      height: 50,
      width: double.infinity,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(0, 3))
      ]),
      clipBehavior: Clip.antiAlias,
      child: LargeButton(
        text: title,
        onTap: () {
          onSubmit();
        },
      ),
    );
  }

  Widget getEditPaymentFormSection() {
    return Container(
      child: Form(
        key: formKey,
        child: Column(children: [
          Helper.getVerticalSpace(20),
          getAmountField(),
          Helper.getVerticalSpace(20),
          getTenantField(),
          Helper.getVerticalSpace(20),
          getPurposeField()
        ]),
      ),
    );
  }

  Widget getAmountField() {
    return TextWithTextField(
        helperText: "Amount",
        placeholder: "amount",
        validator: Helper.getAmountValidator(),
        required: true,
        value: "20,000",
        onChange: (newValue) {
          print("new value is " + newValue);
        });
  }

  Widget getTenantField() {
    String defaultValue = "Select tenant";
    List<String> items = [
      defaultValue,
      "NGOUOGHE Junior - 654370303",
      "junior",
      "hey"
    ];
    return TextWithDropDown(
        helperText: "Tenant",
        placeholder: "tenant",
        required: true,
        value: defaultValue,
        validator: Helper.getDropDownValidator(
            defaultValue: defaultValue, items: items),
        items: items,
        onChange: (newValue) {
          print("new value is " + newValue);
        });
  }

  Widget getPurposeField() {
    return purposeFieldController;
  }
}
