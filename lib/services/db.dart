import 'package:fast8_techtest/models/product_model.dart';
import 'package:sqflite/sqflite.dart' as sqlite;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DatabaseLocal {
  static DatabaseLocal _databaseLocal = DatabaseLocal._singleton();
  factory DatabaseLocal() {
    return _databaseLocal;
  }
  DatabaseLocal._singleton();

  final queries = [
    // UserQuery.DROP_TABLE,
    UserQuery.CREATE_TABLE,
    UserQuery.CREATE_PRODUCT_TABLE,
  ];
  Future<Database> openDB() async {
    print("running");
    final dbPath = await sqlite.getDatabasesPath();
    return sqlite.openDatabase(path.join(dbPath, "local.db"),
        onCreate: (db, version) {
      queries.forEach((element) async {
        await db
            .execute(element)
            .then((value) => print("table created"))
            .catchError((err) {
          print("error saat create tables $err");
        });
      });
    }, version: 1);
  }

  resetTable() async {
    final dbPath = await sqlite.getDatabasesPath();
    var db = await sqlite.openDatabase(path.join(dbPath, "local.db"));
    queries.forEach((element) async {
      await db
          .execute(element)
          .then((value) => print("table created"))
          .catchError((err) {
        print("error saat create tables $err");
      });
    });
    createDummyProduct();
  }

  createDummyProduct() async {
    List<ProductModel> listData = [
      ProductModel(
          imgUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfs4O8wSu5TJCkxupZ7J87LbGb-suq-iscJQ&s",
          desc: "Voucher Digital Indomaret Rp 100.000",
          price: "100000",
          disc: "2"),
      ProductModel(
          imgUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfs4O8wSu5TJCkxupZ7J87LbGb-suq-iscJQ&s",
          desc: "Voucher Digital Indomaret Rp 50.000",
          price: "50000",
          disc: "2"),
      ProductModel(
          imgUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfs4O8wSu5TJCkxupZ7J87LbGb-suq-iscJQ&s",
          desc: "Voucher Digital Alfamart Rp 100.000",
          price: "100000",
          disc: "2"),
      ProductModel(
        imgUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfs4O8wSu5TJCkxupZ7J87LbGb-suq-iscJQ&s",
        desc: "Voucher Digital Gopay Rp 25.000",
        price: "25000",
      ),
      ProductModel(
          imgUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfs4O8wSu5TJCkxupZ7J87LbGb-suq-iscJQ&s",
          desc: "Voucher Digital Grab Rp 30.000",
          price: "3000"),
      ProductModel(
          imgUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfs4O8wSu5TJCkxupZ7J87LbGb-suq-iscJQ&s",
          desc: "Voucher Digital Indomaret Rp 200.000",
          price: "200000",
          disc: "10"),
    ];
    List data = await getData("products");
    if (data.isNotEmpty) {
      return;
    }
    listData.forEach((element) async {
      await insertProduct(element.toMap());
    });
  }

  Future<bool> insert(String table, Map<String, Object> data) async {
    var db = await openDB();
    try {
      await db.insert(table, data,
          conflictAlgorithm: ConflictAlgorithm.replace);
      return true;
    } catch (e) {
      print("errororororor $e");
      return false;
    }
  }

  Future<List> getData(String tableName) async {
    final db = await openDB();
    var result = await db.query(tableName);
    return result.toList();
  }

  Future<bool> insertProduct(Map<String, Object?> data) async {
    var db = await openDB();
    try {
      await db.insert("products", data,
          conflictAlgorithm: ConflictAlgorithm.replace);
      return true;
    } catch (e) {
      print("errororororor $e");
      return false;
    }
  }
}

class UserQuery {
  static const String TABLE_NAME = "users";
  static const String CREATE_TABLE =
      "CREATE TABLE IF NOT EXISTS $TABLE_NAME ( id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT , nohp TEXT , ttl TEXT, gender TEXT, pendidikan TEXT, status TEXT, nik TEXT, alamat TEXT, provinsi TEXT, kota TEXT, kecamatan TEXT, kelurahan TEXT, kode_pos TEXT , nama_per TEXT,alamat_per TEXT,jabatan TEXT,durasi TEXT,sumber TEXT,nominal_pendapatan TEXT,nama_bank TEXT,cabang_bank TEXT,norek TEXT,nama_norek TEXT) ";
  static const String CREATE_PRODUCT_TABLE =
      "CREATE TABLE IF NOT EXISTS products (id INTEGER PRIMARY KEY AUTOINCREMENT, img TEXT, desc TEXT, price TEXT, disc TEXT)";
  static const String SELECT = "select * from $TABLE_NAME";
  static const String CLEAR_TABLE = "DELETE * FROM $TABLE_NAME";
  static const String DROP_TABLE = "DROP TABLE IF EXISTS $TABLE_NAME";
}
