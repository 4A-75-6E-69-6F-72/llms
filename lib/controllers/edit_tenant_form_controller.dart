import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:llms/helpers/custom_navigator.dart';
import 'package:llms/helpers/sql_manager.dart';
import 'package:llms/views/pages/tenant_form.dart';

class EditTenantFormController extends StatefulWidget {
  Map tenant;
  Function refresh;
  EditTenantFormController(
      {required this.tenant, required this.refresh, super.key});

  @override
  State<EditTenantFormController> createState() =>
      _EditTenantFormControllerState();
}

class _EditTenantFormControllerState extends State<EditTenantFormController> {
  XFile? profilePic;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TenantForm(
      deleteItem: deleteItem,
      tenant: widget.tenant,
      setProfilePic: (newValue) {
        setState(() {
          profilePic = newValue;
        });
      },
      profilePic: profilePic,
      title: "Edit Tenant",
      onSubmit: (tenant) {
        editTenant(tenant);
      },
    );
  }

  void editTenant(Map tenant) {
    SqlManager.editTenant(tenant).then((edited) {
      if (edited) {
        print("edited tenant");
        widget.refresh();
        Navigator.of(context).pop();
      } else {
        print("could not edit tenant");
      }
    });
  }

  void toggleLoading() {
    print("toggle Loading");
  }

  deleteItem(int id) async {
    bool deleted = await SqlManager.deleteTenantById(id);
    if (deleted) {
      print("deleted item");
      CustomNavigator.pop(context);
      widget.refresh();
    } else {
      print("could not delete item");
    }
  }
}
