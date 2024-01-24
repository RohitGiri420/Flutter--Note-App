import 'package:flutter/material.dart';

class UiHelper {
  static CustomTextField(
      {required String Hint,
      required TextEditingController controller,
      required IconData icon,
      required bool obscure}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Card(
        elevation: 4,
        surfaceTintColor: Colors.yellowAccent.shade100,
        color: Colors.white,
        shadowColor: Colors.black,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Colors.white)),
        child: TextField(
          style: TextStyle(fontFamily: 'Custom'),
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
              hintText: Hint,
              hintStyle: TextStyle(fontFamily: 'Custom',fontWeight: FontWeight.w600),

              prefixIcon: Icon(icon),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.white))),
        ),
      ),
    );
  }

 static CustomLoginButton(VoidCallback onpressed){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
      child: InkWell(
        onTap: onpressed,
        child: Card(
          elevation: 4,
          surfaceTintColor: Colors.yellowAccent.shade100,
          color: Colors.white,
          shadowColor: Colors.black,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.white)),
          child: Container(
            height: 62,
            width: 350,
            color: Colors.yellow.shade100,
            child: Center(child: Text("Login",style: TextStyle(fontFamily: 'Custom',fontSize: 22,fontWeight: FontWeight.w900,color: Colors.black54),)),
          ),
        ),
      ),
    );
 }
 
 
 static HomeScreenHeading(){
    return Text("My Notes", style: TextStyle(fontFamily: 'Custom',fontSize: 33,fontWeight: FontWeight.w900),);
 }
 
 static HomeAScreenTopBar(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        CircleAvatar(),
        Text("Hii, Rohit",style: TextStyle(fontFamily: 'Custom'),),
        SizedBox(width: 120,),
        Icon(Icons.menu)
      ],

    );
 }

 static
}