import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static late Database myDb;

  static Future<void> initDb() async {
    myDb = await openDatabase('tasks.db',
    version: 1,
    onCreate: (db, version)async{
      print('OnCreate DB is called');
       await db.execute(
      'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, name TEXT, isDone INTEGER)');
    },
    onOpen: (db) {
      print('OnOpen DB is called');
    },
    );
  }
  
  static Future<void> insertTask(String taskName)async{
    await myDb.transaction((txn) async {
  int id1 = await txn.rawInsert(
      'INSERT INTO Tasks(name,isDone) VALUES("$taskName",0)');
  print('inserted1: $id1');

});
  }

  static Future<List<Map<String,dynamic>>> readTasksFromDB()async{
    var listOfTasks = await myDb.rawQuery('SELECT * FROM Tasks');
    print('All tasks : $listOfTasks');
    return listOfTasks;
  }

  static Future<void> markTaskAsDone(int taskID)async{
    await myDb.rawUpdate(
    'UPDATE Tasks SET isDone = 1 WHERE id = $taskID');
  }
}