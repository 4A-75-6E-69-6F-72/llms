import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:llms/helpers/helper.dart';
import 'package:llms/helpers/sql_manager.dart';
import 'package:llms/models/tenant.dart';
import 'package:llms/views/pages/tenant_form.dart';

class AddTenantFormController extends StatefulWidget {
  AddTenantFormController({this.refresh, super.key});
  Function? refresh;
  @override
  State<AddTenantFormController> createState() =>
      _AddTenantFormControllerState();
}

class _AddTenantFormControllerState extends State<AddTenantFormController> {
  XFile? profilePic;
  @override
  Widget build(BuildContext context) {
    return TenantForm(
      tenant: {},
      setProfilePic: (newValue) {
        setState(() {
          profilePic = newValue;
        });
      },
      profilePic: profilePic,
      title: "Add Tenant",
      onSubmit: (tenant) {
        saveTenant(tenant);
      },
      showDeleteIcon: false,
    );
  }

  void saveTenant(Map newTenant) async {
    print(newTenant);
    if (widget.refresh != null) {
      widget.refresh!();
    }
    Navigator.pop(context);
    toggleLoading();
    bool saved = await SqlManager.saveItem(newTenant, "Tenant");
    if (!saved) {
      showErrorMessage();
    }
    toggleLoading();
    // await SqlManager.saveTenant(newTenant);
  }

  void toggleLoading() {
    print("toggleLoading");
    setState(() {});
  }

  void showErrorMessage() {
    print("show error message");
    setState(() {});
  }
}
