import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/helpers/helper.dart';
import 'package:llms/models/purpose.dart';
import 'package:llms/models/service.dart';
import 'package:llms/repository/purposes.dart';
import 'package:llms/views/components/purpose_field.dart';

class PurposeFieldController extends StatefulWidget {
  PurposeFieldController({super.key});

  List<Purpose> selectedPurposes = getPurposes();

  bool validate() {
    if (selectedPurposes.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  State<PurposeFieldController> createState() => _PurposeFieldControllerState();
}

class _PurposeFieldControllerState extends State<PurposeFieldController> {
  List<Service> services = getServices();
  late String service = services[0].name!;
  String units = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PurposeField(
        setService: (newService) {
          setService(newService);
        },
        setUnits: (newUnits) {
          setUnits(newUnits);
        },
        removePurpose: (purpose) {
          removePurpose(purpose);
        },
        services: services,
        selectedPurposes: widget.selectedPurposes,
        onAdd: () {
          addPurpose();
        },
        onDelete: (purpose) {
          onDelete(purpose);
        });
  }

  void addPurpose() {
    if (validPurpose()) {
      Purpose newPurpose = Purpose();
      newPurpose.id = "${(getHighestPurposeId() + 1)}";
      newPurpose.service = getCurrentService();
      newPurpose.unit = getUnits();
      setState(() {
        widget.selectedPurposes.add(newPurpose);
      });
    }
  }

  int getHighestPurposeId() {
    String highestPurposeId = "1";
    for (Purpose purpose in getPurposes()) {
      if (purpose.id!.compareTo(highestPurposeId) > 0) {
        highestPurposeId = purpose.id!;
      }
    }
    return int.parse(highestPurposeId);
  }

  Service? getCurrentService() {
    for (Service s in services) {
      if (s.name == service) {
        return s;
      }
    }
    return null;
  }

  int? getUnits() {
    return int.parse(units);
  }

  bool validPurpose() {
    return fieldsAreValid() && serviceIsNotAmongPurposes();
  }

  bool fieldsAreValid() {
    return service.isNotEmpty && units.isNotEmpty && Helper.isInt(units);
  }

  bool serviceIsNotAmongPurposes() {
    for (Purpose selectedPurpose in widget.selectedPurposes) {
      if (selectedPurpose.service!.name == service) {
        return false;
      }
    }
    return true;
  }

  void onDelete(Purpose toBeDeleted) {
    setState(() {
      widget.selectedPurposes.remove(toBeDeleted);
    });
  }

  void removePurpose(Purpose purpose) {
    print("remove Purpose ${purpose.id}");
    Purpose? itemToBeRemoved;
    for (Purpose selectedPurpose in widget.selectedPurposes) {
      if (purpose.id == selectedPurpose.id) {
        itemToBeRemoved = selectedPurpose;
      }
    }
    setState(() {
      widget.selectedPurposes.remove(itemToBeRemoved);
    });
  }

  void setService(String newService) {
    print('new service $newService');
    service = newService;
  }

  void setUnits(String newUnits) {
    print('new service $newUnits');
    units = newUnits;
  }

  void showErrorMessage() {
    setState(() {});
  }
}
