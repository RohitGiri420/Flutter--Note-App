

import 'package:flutter/foundation.dart';
import 'package:notesapp/Database/DbHelper.dart';

class NoteModel{

  int? Id;
  String Title;
  String disc;

  NoteModel({required this.Title,required this.disc,this.Id});

  factory NoteModel.fromMap(Map<String,dynamic>map){
    return NoteModel(Title: map[DbHelper.NotesTitle], disc: map[DbHelper.NtoesDisc],Id: map[DbHelper.NotesId]);
  }

  Map<String,dynamic> toMap(){
    return {
      DbHelper.NotesId:Id,
      DbHelper.NotesTitle:Title,
      DbHelper.NtoesDisc:disc
    };
  }

}