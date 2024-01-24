import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{

  String TableName = "Notes_Table";
  String NotesId ="Notes_ID";
  String NotesTitle = "Notes_Title";
  String NtoesDisc = "Notes_Disc";

  Database? _database;

  getDb(){
    if(_database!=null){
      return _database;
    }

    else{
      initDB();
    }
  }




Future<Database> initDB() async{
  Directory directory = await getApplicationDocumentsDirectory();
  var path = join(directory.path+"notesDb.db");
  return openDatabase(path,version: 1,onCreate: (db, version) {
    db.execute("CREATE TABLE $TableName($NotesId INTEGER PRIMARY KEY AUTOINCREMENT, $NotesTitle TEXT, $NtoesDisc TEXT )");
  },);
}
}