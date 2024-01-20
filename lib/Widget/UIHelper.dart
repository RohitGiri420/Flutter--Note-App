import 'package:flutter/material.dart';

class UiHelper{
static CustomTextField(){

 return Padding(
   padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 15),
   child: Card(
     elevation: 5,
     child: TextField(
       decoration: InputDecoration(
         label: Text("Email"),
         prefixIcon: Icon(Icons.email),
         enabledBorder: OutlineInputBorder(
         )
       ),
     ),
   ),
 );

}
}