import 'package:llms/helpers/helper.dart';
import 'package:sqflite/sqflite.dart';

class SqlManager {
  static openDB() async {
    return await openDatabase('my_db.db');
  }

  static closeDB(db) {
    db.close();
  }

  static createDatabase() async {
    var db = await openDB();

    String serviceTableSql = """CREATE TABLE IF NOT EXISTS Service (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255),
    description VARCHAR(255),
    amount DECIMAL(10, 2),
    durationId INT,
    date_created DATE,
    date_edited DATE,
    FOREIGN KEY (durationId) REFERENCES Duration(id)
);""";

    await db.execute(serviceTableSql);

    String durationTableSql = """CREATE TABLE IF NOT EXISTS Duration (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    day INT,
    month INT,
    year INT,
    date_created DATE,
    date_edited DATE
);
""";

    await db.execute(durationTableSql);

    String tenantTableSql = """CREATE TABLE IF NOT EXISTS Tenant (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname VARCHAR(255),
    phone_number VARCHAR(20),
    job VARCHAR(255),
    rent DECIMAL(10, 2),
    entry_date DATE,
    date_created DATE,
    date_edited DATE
);
""";

    await db.execute(tenantTableSql);

    String paymentTableSql = """CREATE TABLE IF NOT EXISTS Payment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    amount DECIMAL(10, 2),
    type VARCHAR(255),
    tenantId INT,
    date DATE,
    purposesId INT,
    date_created DATE,
    date_edited DATE,
    FOREIGN KEY (tenantId) REFERENCES Tenant(id),
    FOREIGN KEY (purposesId) REFERENCES Purpose(id)
);
""";

    await db.execute(paymentTableSql);

    String purposeTableSql = """CREATE TABLE IF NOT EXISTS Purpose (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    serviceId INT,
    unit VARCHAR(255),
    date_created DATE,
    date_edited DATE,
    FOREIGN KEY (serviceId) REFERENCES Service(id)
);
""";

    await db.execute(purposeTableSql);
    closeDB(db);

    // await db.rawInsert(
    //     'INSERT INTO Tenant(fullname, phone_number, job, rent, entry_date, date_created, date_edited) VALUES(?, ?, ?, ?,?, ?,?)',
    //     [
    //       "Ngouoghe Junior",
    //       "654370303",
    //       "Doctor",
    //       100000,
    //       "2022-06-02",
    //       "2022-06-02",
    //       "2022-06-02"
    //     ]);
    // List<Map> list = await db.rawQuery('SELECT * FROM Tenant');
    // print(list);
  }

  static Future<List<Map>> getItems(String tableName) async {
    var db = await openDB();

    List<Map> items = await db.rawQuery('SELECT * FROM $tableName');

    closeDB(db);

    return items;
  }

  static Future<bool> saveItem(Map item, String tableName) async {
    try {
      var db = await openDB();

      String tableFields = "";
      String valuesQuestionMarks = "";
      List<String> items = [];

      for (String key in item.keys) {
        tableFields += "$key,";
        valuesQuestionMarks += "?,";
        items.add(item[key]);
      }

      tableFields = Helper.removeLastCharacter(tableFields);
      valuesQuestionMarks = Helper.removeLastCharacter(valuesQuestionMarks);

      await db.rawInsert(
          'INSERT INTO $tableName($tableFields) VALUES($valuesQuestionMarks)',
          items);

      closeDB(db);

      return true;
    } catch (e) {
      print("error in saving an item: $item");
      return false;
    }
  }

  static Future<List<Map>> getItemById(var id, String tableName) async {
    var db = await openDB();

    List<Map> items =
        await db.rawQuery('SELECT * FROM $tableName WHERE id = $id');

    closeDB(db);

    return items;
  }

  static Future<bool> editTenant(Map tenant) async {
    try {
      var db = await openDB();

      await db.rawUpdate(
          'UPDATE Tenant SET fullname = ?, phone_number = ?, job = ?, rent = ?, entry_date = ?, date_created = ?, date_edited = ?  WHERE id = ?',
          [
            tenant["fullname"],
            tenant["phone_number"],
            tenant["job"],
            tenant["rent"],
            tenant["entry_date"],
            tenant["date_created"],
            tenant["date_edited"],
            tenant["id"]
          ]);

      closeDB(db);

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deleteTenantById(int id) async {
    try {
      var db = await openDB();
      await db.rawDelete('DELETE FROM Tenant WHERE id = ?', [id]);
      closeDB(db);
      return true;
    } catch (e) {
      return false;
    }
  }
}
