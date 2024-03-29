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


  TextEditingController notecomtroller = TextEditingController();
  TextEditingController desccintroller = TextEditingController();

  TextEditingController updatednotecomtroller = TextEditingController();
  TextEditingController updateddesccintroller = TextEditingController();
  List<NoteModel> arrlist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,

      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context, builder: (context) {
          return SingleChildScrollView(
            child: Container(
              width: 400,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UiHelper.CustomTextField(Hint: "Title", controller: notecomtroller, icon: Icons.title_rounded, obscure: false),
                  UiHelper.CustomTextField(Hint: "Description", controller: desccintroller, icon: Icons.description_rounded, obscure: false),
                  UiHelper.CustomLoginButton(() {addData(notecomtroller.text.toString(), desccintroller.text.toString());
                  setState(() {
            
                  });
                  Navigator.pop(context);
                  },"Save"
            
                  )
                ],
              ),
            ),
          );
        },);
      },
      child: Icon(Icons.add,size: 32,color: Colors.black54,),
      ),


      //APP BAR.................................................................
      appBar: AppBar(
        title: Container(
          child: UiHelper.HomeScreenTopBar(),
        ),
        backgroundColor: Colors.yellow.shade100,
      ),


      //BODY....................................................................
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Text("${arrlist[index].Id}"),
            title: Text("${arrlist[index].Title}"),
            subtitle: Text("${arrlist[index].disc}"),
            onTap: (){
              showModalBottomSheet(context: context, builder: (context) {
                return SingleChildScrollView(
                  child: Container(
                    width: 400,
                    height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        UiHelper.CustomTextField(Hint: "New Title", controller: updatednotecomtroller, icon: Icons.title_rounded, obscure: false),
                        UiHelper.CustomTextField(Hint: "New Description", controller: updateddesccintroller, icon: Icons.description_rounded, obscure: false),
                        UiHelper.CustomLoginButton(() {
                          updateData(updatednotecomtroller.text.toString(), updateddesccintroller.text.toString(),arrlist[index].Id!);
                          Navigator.pop(context);
                        },
                            "Save")
                      ],
                    ),
                  ),
                );
              },);
            },
            trailing: IconButton(onPressed: (){
              deleteData(arrlist[index].Id!);
              getData();
            },icon: Icon(Icons.delete_forever),),
          ),
        );
      },
      itemCount: arrlist.length),
    );
  }

  addData(String title , String desc) async{
    if(Title == ""||desc == ""){
      log("enter Required fields");
    }
    else{
      bool check = await DbHelper().addData(NoteModel(Title: title, disc: desc));
      log("data inserted sucessfully");
      if(check){
          getData();
      }
      }
    }

  getData() async{
    arrlist = await DbHelper().getData();
    setState(() {

    });
  }

  updateData(String title, String desc,int id) async{
    if(Title == ""||desc == ""){
      log("enter Required fields");
    }
    else{
      await DbHelper().updateData(NoteModel(Title: title, disc: desc,Id: id));
      getData();

    }
  }

  deleteData( int id) async{
     await DbHelper().deleteData(id);
    getData();


  }
}
