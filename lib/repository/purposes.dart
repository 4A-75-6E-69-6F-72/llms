import 'package:llms/models/purpose.dart';
import 'package:llms/models/service.dart';

// List<Purpose> getPurposes() {
// Purpose purpose1 = Purpose();
// purpose1.setId = "1";
// Service service1 = Service();
// service1.setName = "Rent";
// service1.setAmount = 70000;
// service1.setDescription =
//     "The fees for staying in the alocated location for a given amount of time";
// service1.setId = "1";
// purpose1.setService = service1;
// purpose1.set
// }

List<Service> getServices() {
  List<Service> services = [];

  Service service1 = Service();
  service1.id = "1";
  service1.description = "The fees for using water from the drilling machine";
  service1.amount = 70000;
  service1.name = "Water";
  services.add(service1);

  Service service2 = Service();
  service2.id = "2";
  service2.description =
      "The fees for staying in the alocated location for a given amount of time";
  service2.amount = 70000;
  service2.name = "Rent";
  services.add(service2);

  return services;
}

List<Purpose> getPurposes() {
  List<Purpose> purposes = [];

  Service service1 = Service();
  service1.id = "1";
  service1.description = "The fees for using water from the drilling machine";
  service1.amount = 70000;
  service1.name = "Water";
  Purpose purpose1 = Purpose();
  purpose1.service = service1;
  purpose1.unit = 2;
  purpose1.id = "1";
  purposes.add(purpose1);

  Service service2 = Service();
  service2.id = "2";
  service2.description =
      "The fees for staying in the alocated location for a given amount of time";
  service2.amount = 70000;
  service2.name = "Rent";
  Purpose purpose2 = Purpose();
  purpose2.service = service2;
  purpose2.unit = 1;
  purpose2.id = "2";
  purposes.add(purpose2);

  return purposes;
}
