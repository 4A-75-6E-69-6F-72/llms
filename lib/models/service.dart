import 'package:llms/models/custom_duration.dart';

class Service {
  String? id;
  String? name;
  String? description;
  double? amount;
  CustomDuration? duration;

  String? get getId => this.id;

  set setId(String? id) => this.id = id;

  String? get getName => this.name;

  set setName(String? name) => this.name = name;

  get getDescription => this.description;

  set setDescription(description) => this.description = description;

  get getAmount => this.amount;

  set setAmount(amount) => this.amount = amount;

  get getDuration => this.duration;

  set setDuration(duration) => this.duration = duration;
}
