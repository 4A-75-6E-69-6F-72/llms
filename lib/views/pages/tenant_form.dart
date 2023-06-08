import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:llms/controllers/purpose_field_controller.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/helpers/custom_navigator.dart';
import 'package:llms/helpers/helper.dart';
import 'package:llms/helpers/sql_manager.dart';
import 'package:llms/views/components/custom_drop_down_field.dart';
import 'package:llms/views/components/custom_icon.dart';
import 'package:llms/views/components/custom_text_field.dart';
import 'package:llms/views/components/large_button.dart';
import 'package:llms/views/components/profile_pic.dart';
import 'package:llms/views/components/profile_pic_picker.dart';
import 'package:llms/views/components/text_with_drop_down.dart';
import 'package:llms/views/components/text_with_text_field.dart';

class TenantForm extends StatelessWidget {
  Map tenant;
  String title;
  Function onSubmit;
  bool showDeleteIcon;
  XFile? profilePic;
  Function setProfilePic;
  Function? deleteItem;
  TenantForm(
      {required this.tenant,
      this.profilePic,
      required this.setProfilePic,
      required this.title,
      required this.onSubmit,
      this.deleteItem,
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
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        getEditPaymentHeader(context),
        getFormFieldsSection(context)
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
                message: "Are you sure you want to delete this Tenant?",
                onConfirm: () {
                  print("deletedItem");
                  deleteItem!(tenant["id"]);
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
          saveTenant();
        },
      ),
    );
  }

  Widget getFormFieldsSection(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
            child: Container(
      child: Column(children: [
        Helper.getVerticalSpace(20),
        getProfilePicField(),
        Helper.getVerticalSpace(20),
        getFullNameField(),
        Helper.getVerticalSpace(20),
        getPhoneNumberField(),
        Helper.getVerticalSpace(20),
        getJobField(),
        Helper.getVerticalSpace(20),
        getRentField(),
        Helper.getVerticalSpace(20),
        getEntryDateField(),
        Padding(padding: MediaQuery.of(context).viewInsets),
      ]),
    )));
  }

  Widget getProfilePicField() {
    return ProfilePicPicker(profilePic, (newProfilePic) {
      setProfilePic(newProfilePic);
    });
  }

  Widget getFullNameField() {
    return TextWithTextField(
        helperText: "Full name",
        placeholder: "full name",
        required: true,
        value: tenant["fullname"] ?? "",
        onChange: (newValue) {
          tenant["fullname"] = newValue;
          print("new full name is " + newValue);
        });
  }

  Widget getPhoneNumberField() {
    return TextWithTextField(
        helperText: "Phone number",
        placeholder: "phone number",
        required: true,
        value: tenant["phone_number"] ?? "",
        onChange: (newValue) {
          tenant["phone_number"] = newValue;
          print("new value is " + newValue);
        });
  }

  Widget getJobField() {
    return TextWithTextField(
        helperText: "Job",
        placeholder: "job",
        required: false,
        value: tenant["job"] ?? "",
        onChange: (newValue) {
          tenant["job"] = newValue;
          print("new value is " + newValue);
        });
  }

  Widget getRentField() {
    return TextWithTextField(
        helperText: "Rent",
        placeholder: "rent",
        required: true,
        value: tenant["rent"] != null ? "${tenant["rent"]}" : "",
        onChange: (newValue) {
          tenant["rent"] = newValue;
          print("new value is " + newValue);
        });
  }

  Widget getEntryDateField() {
    return TextWithTextField(
        helperText: "Entry date",
        placeholder: "entry date",
        required: true,
        value: tenant["entry_date"] ?? "",
        onChange: (newValue) {
          tenant["entry_date"] = newValue;
          print("new value is " + newValue);
        });
  }

  Widget getPurposeField() {
    return PurposeFieldController();
  }

  saveTenant() {
    // should get the current date for both fields
    if (tenant["id"] == null) {
      tenant["date_created"] = "05/03/2023";
    }

    tenant["date_edited"] = "05/03/2023";
    onSubmit(tenant);
  }
}
