import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:notesapp/Model/NoteModel.dart';

class DbHelper {
  static final DbHelper db = DbHelper();

  static String TableName = "Notes_Table";
  static String NotesId = "Notes_ID";
  static String NotesTitle = "Notes_Title";
  static String NtoesDisc = "Notes_Disc";

  Database? _database;

   Future<Database> getDb() async{
    if (_database != null) {
      return  _database!;
    } else {
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path + "notesDb.db");
    return openDatabase(path, version: 1, onCreate: (db, version) {
        db.execute(
            "CREATE TABLE $TableName($NotesId INTEGER PRIMARY KEY AUTOINCREMENT, $NotesTitle TEXT, $NtoesDisc TEXT )");
      },
    );
  }

  Future<bool> addData(NoteModel noteModel) async{
     var db = await getDb();
     int count = await db.insert(TableName,noteModel.toMap());
     return count>0;
  }

  Future<List<NoteModel>> getData() async{
     var db = await getDb();
     List<NoteModel> list =[];

     var data = await db.query(TableName);

     for(Map<String,dynamic> eachData in data){
       NoteModel noteModel = NoteModel.fromMap(eachData);
       list.add(noteModel);
     }
     return list;
  }
}
