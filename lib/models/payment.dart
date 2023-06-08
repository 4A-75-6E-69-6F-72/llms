import 'package:llms/models/purpose.dart';
import 'package:llms/models/tenant.dart';

class Payment {
  String? id;
  int? amount;
  String? type;
  Tenant? tenant;
  String? date;
  Purpose? purpose;
  String? dateCreated;
  String? dateEdited;

  String? get getId => this.id;

  set setId(String? id) => this.id = id;

  int? get getAmount => this.amount;

  set setAmount(int? amount) => this.amount = amount;

  get getType => this.type;

  set setType(type) => this.type = type;

  get getTenant => this.tenant;

  set setTenant(tenant) => this.tenant = tenant;

  get getDate => this.date;

  set setDate(date) => this.date = date;

  get getPurpose => this.purpose;

  set setPurpose(purpose) => this.purpose = purpose;

  get getDateCreated => this.dateCreated;

  set setDateCreated(dateCreated) => this.dateCreated = dateCreated;

  get getDateEdited => this.dateEdited;

  set setDateEdited(dateEdited) => this.dateEdited = dateEdited;
}
