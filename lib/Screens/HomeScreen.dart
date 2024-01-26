import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notesapp/Database/DbHelper.dart';
import 'package:notesapp/Model/NoteModel.dart';
import 'package:notesapp/Widget/UIHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late DbHelper db;

  List<NoteModel> list = [];
  TextEditingController notecomtroller = TextEditingController();
  TextEditingController desccintroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.yellow.shade100,

      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context, builder: (context) {
          return Container(
            height: 400,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                UiHelper.CustomTextField(Hint: "Note", controller: notecomtroller, icon: Icons.note_alt_rounded, obscure: false),
                UiHelper.CustomTextField(Hint: "Description", controller: desccintroller, icon: Icons.description_rounded, obscure: false),
                ElevatedButton(onPressed: (){addData(notecomtroller.text.toString(), desccintroller.text.toString());}, child: Text("Save")),
              ],
            ),
          );
        },);
      },

      child: Icon(Icons.add),
      backgroundColor: Colors.yellow.shade300),
      appBar: AppBar(
        title: Container(
          child: UiHelper.HomeScreenTopBar(),
        ),
        backgroundColor: Colors.yellow.shade100,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
          child: ListView.builder(itemBuilder: (context, index) {
            return UiHelper.CustomListTile("","");
          },
          ),
        ),
      ),
    );
  }
  getData() async{
    list= await db.getData();
  }

  addData(String title,String desc) async{
    if(title==""||desc==""){
      log("enter required field");
    }
    else{
      bool check=await db.addData(NoteModel(Title: title, disc: desc));
        if(check){
          getData();
          setState(() {
          });

        }

    }

  }
}
