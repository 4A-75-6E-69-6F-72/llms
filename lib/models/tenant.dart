class Tenant {
  String? id;
  String? fullName;
  int? phoneNumber;
  String? job;
  double? rent;
  String? entryDate;
  String? dateCreated;
  String? dateEdited;

  String? get getId => this.id;

  set setId(String? id) => this.id = id;

  String? get getFullName => this.fullName;

  set setFullName(String? fullName) => this.fullName = fullName;

  get getPhoneNumber => this.phoneNumber;

  set setPhoneNumber(phoneNumber) => this.phoneNumber = phoneNumber;

  get getJob => this.job;

  set setJob(job) => this.job = job;

  get getRent => this.rent;

  set setRent(rent) => this.rent = rent;

  get getEntryDate => this.entryDate;

  set setEntryDate(entryDate) => this.entryDate = entryDate;

  get getDateCreated => this.dateCreated;

  set setDateCreated(dateCreated) => this.dateCreated = dateCreated;

  get getDateEdited => this.dateEdited;

  set setDateEdited(dateEdited) => this.dateEdited = dateEdited;
}
