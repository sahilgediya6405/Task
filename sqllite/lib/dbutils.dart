import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqllite/sstudent_model.dart';

class DBUtils {
  static final DBUtils database = DBUtils._privateConstructor();
  
    static Future<DBUtils>  getsingletonclass()async{
    await initDB();
    return database;
  }
  DBUtils._privateConstructor();

static  late Database CurrentDB;

static Future<void> initDB() async {
   CurrentDB = await openDatabase('mydb.db', version: 1,
        onCreate: (Database db, int version) async {
    await db.execute(
            "CREATE TABLE student(id INTEGER  PRIMARY KEY AUTOINCREMENT, name TEXT, mark INTEGER, city TEXT)");


    await  db.execute(
              "INSERT INTO student(id, name, mark, city) VALUES(1, 'Rohit', 27, 'Surat'), (2, 'Sahil', 30, 'Ahemdabad'), (3, 'Rutu', 34, 'Mumbai')");

    });
  }

 Future<List<Student>> getRecod({bool low = true}) async {
    String query;
    if (low == false) {
      query = "SELECT * FROM student ORDER BY mark ASC";
    } else {
      query = "SELECT * FROM student ORDER BY mark DESC";
    }
    List<Map<String, dynamic>> studentMapList = await CurrentDB.rawQuery(query);

    List<Student> listStudent = List.generate(studentMapList.length, (i) {
      return Student.fromMap(studentMapList[i]);
    });
    return listStudent;
  }

  Future<void> addRecod(BuildContext context ,String name,String city,int mark)async{
    await CurrentDB.transaction((txn)async{
      await  txn.rawQuery( 'INSERT INTO student(name,mark,city) VALUES(?,?,?)',[name, mark, city]);
    }); 

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Save Student Details")));
}
}


