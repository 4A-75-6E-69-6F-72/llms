import 'package:llms/models/service.dart';

class Purpose {
  String? id;
  Service? service;
  int? unit;
  String? dateCreated;
  String? dateEdited;

  String? get getId => this.id;

  set setId(String? id) => this.id = id;

  Service? get getService => this.service;

  set setService(Service? service) => this.service = service;

  get getUnit => this.unit;

  set setUnit(unit) => this.unit = unit;

  get getDateCreated => this.dateCreated;

  set setDateCreated(dateCreated) => this.dateCreated = dateCreated;

  get getDateEdited => this.dateEdited;

  set setDateEdited(dateEdited) => this.dateEdited = dateEdited;
}
