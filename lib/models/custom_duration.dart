class CustomDuration {
  String? id;
  int day = 0;
  int month = 0;
  int year = 0;
  String? dateCreated;
  String? dateEdited;

  String? get getId => this.id;

  set setId(String? id) => this.id = id;

  int? get getDay => this.day;

  set setDay(int day) => this.day = day;

  get getMonth => this.month;

  set setMonth(month) => this.month = month;

  get getYear => this.year;

  set setYear(year) => this.year = year;

  get getDateCreated => this.dateCreated;

  set setDateCreated(dateCreated) => this.dateCreated = dateCreated;

  get getDateEdited => this.dateEdited;

  set setDateEdited(dateEdited) => this.dateEdited = dateEdited;
}
