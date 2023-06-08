import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/helpers/helper.dart';
import 'package:llms/models/purpose.dart';
import 'package:llms/models/service.dart';
import 'package:llms/views/components/custom_button.dart';
import 'package:llms/views/components/custom_drop_down_field.dart';
import 'package:llms/views/components/custom_text_field.dart';
import 'package:llms/views/components/field_text.dart';
import 'package:llms/views/components/purpose_widget.dart';

class PurposeField extends StatelessWidget {
  List<Service> services;
  List<Purpose> selectedPurposes;
  Function onAdd;
  Function onDelete;
  Function removePurpose;

  Function setService;
  Function setUnits;
  PurposeField(
      {required this.removePurpose,
      required this.services,
      required this.selectedPurposes,
      required this.onAdd,
      required this.onDelete,
      required this.setService,
      required this.setUnits,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FieldText(helperText: "Purpose(s)", required: true),
        getSelectedPurposes(),
        CustomDropDownField(
            placeholder: "Service",
            value: getInitialValue(),
            items: getDropDownItems(),
            onChange: (newValue) {
              setService(newValue);
            }),
        Helper.getVerticalSpace(20),
        CustomTextField(
            isInt: true,
            value: "",
            onChange: (newValue) {
              setUnits(newValue);
            },
            placeholder: "units"),
        Helper.getVerticalSpace(20),
        getAddButton()
      ],
    );
  }

  Widget getSelectedPurposes() {
    if (selectedPurposes.length > 0) {
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: getPurposeItems(),
      );
    }
    return Container();
  }

  Widget getPurposeItems() {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 8,
      runSpacing: 8,
      children: selectedPurposes.map((selectedPurpose) {
        return getPurposeWidget(selectedPurpose);
      }).toList(),
    );
  }

  Widget getPurposeWidget(Purpose purpose) {
    return Container(
      width: null,
      height: null,
      child: PurposeWidget(
          content: purpose,
          onTap: () {
            removePurpose(purpose);
          }),
    );
  }

  String getInitialValue() {
    String? initialValue;
    if (services.length > 0) {
      initialValue = services[0].name;
    }
    if (initialValue == null) {
      return "";
    }
    return initialValue;
  }

  List<String> getDropDownItems() {
    if (services.length > 0) {
      return services.map((service) {
        String? serviceName = service.getName;
        if (serviceName != null) {
          return serviceName;
        } else {
          return "";
        }
      }).toList();
    }
    return [];
  }

  Widget getAddButton() {
    return CustomButton(
      backgroundColor: Config.primaryColor.withOpacity(0.09),
      fontColor: Config.primaryColor,
      content: "Add Purpose",
      fontSize: 14,
      onTap: () {
        onAdd();
      },
    );
  }
}
