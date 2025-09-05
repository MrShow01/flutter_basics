import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class ProductCubit extends Cubit<int> {
  ProductCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  void reset() => emit(0);
  void setValue(int value) {
    //add your logic
    emit(value);
  }

  openDb() async {
    Database database = await openDatabase('my_db.db', version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
      await db.execute(
          'CREATE TABLE Product (id INTEGER PRIMARY KEY, name TEXT, price REAL, inStock INTEGER)');
    });

    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
      log('inserted1: $id1');
      int id2 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
          ['another name', 12345678, 3.1416]);
      log('inserted2: $id2');
    });
    var batch = database.batch();
    batch.insert('Test', {'name': 'batch name 1', 'value': 111, 'num': 1.1});
    batch.insert('Test', {'name': 'batch name 2', 'value': 222, 'num': 2.2});
    batch.insert('Test', {'name': 'batch name 3', 'value': 333, 'num': 3.3});
    await batch.commit();
    batch.insert('Product', {'name': 'Product 1', 'price': 9.99, 'inStock': 1});
    batch
        .insert('Product', {'name': 'Product 2', 'price': 19.99, 'inStock': 0});
    batch
        .insert('Product', {'name': 'Product 3', 'price': 29.99, 'inStock': 1});
    await batch.commit();
    var result =
        await database.rawQuery('SELECT * FROM Test WHERE value < 300');
    var resultProduct = await database.rawQuery('SELECT * FROM Product');
    log(result.toString());
    log(resultProduct.toString());
    log(resultProduct[0].toString());
  }

  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('Token', 'Tokrnjkdsfkdcfdhjjgfkd2sfd1v2scs2v2f');
    await prefs.setStringList('Role', ['Admin', 'User']);
    log('Token saved');

    String? token;
    List<String>? role;
    log(token.toString());

    token = prefs.getString('Token');
    role = prefs.getStringList('Role');

    log(token.toString());
    log(role.toString());
    final storage = FlutterSecureStorage();
    storage.write(key: 'person', value: 'Khaled');
    String? person = await storage.read(key: 'person');
    log(person.toString());
    // final box = await Hive.openBox('myBox');
    // await box.put(
    //     'name', Person(name: 'Khaled', age: 96, friends: ['A', 'B', 'C']));
    // Person person = await box.get('name');

    Database database = await openDatabase('my_dbre.db');
    //var result = await database.rawQuery('SELECT * FROM Test WHERE id = 1');
    var result = await database.query('Test', where: 'id = ?', whereArgs: [1]);
    Example example = Example.fromJson(result[0]);
    // return example;
    // log(result.toString());
  }
}

sealed class ProductEvent {}

final class ProductPriceIncrement extends ProductEvent {}

final class ProductPriceDecrement extends ProductEvent {}

final class ProductBloc extends Bloc<ProductEvent, int> {
  ProductBloc() : super(0) {
    on<ProductPriceIncrement>((event, emit) {
      //Add your logic here
      emit(state + 1);
    });
    on<ProductPriceDecrement>((event, emit) => emit(state - 1));
  }
}

@HiveType(typeId: 0)
class Example extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  int? value;
  @HiveField(3)
  double? num;

  Example({this.id, this.name, this.value, this.num});

  Example.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
    num = json['num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['value'] = this.value;
    data['num'] = this.num;
    return data;
  }
}
