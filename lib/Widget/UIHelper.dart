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
 
 
 static CustomListTile(String title, String desc){
    return Card(
      elevation: 4,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white24,width: 3)
      ),
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10,left: 8,right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: TextStyle(fontSize: 22,fontFamily: 'Custom',fontWeight: FontWeight.w700),),
              SizedBox(height: 5,),
              Text(desc,style: TextStyle(fontSize: 20,fontFamily: 'Custom',fontWeight: FontWeight.w500),),

            ],
          ),
        ),
      ),
    );

 }
 
 static HomeScreenTopBar(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text("My Notes",style: TextStyle(fontFamily: 'Custom'),),
        SizedBox(width: 120,),
        Icon(Icons.menu)
      ],
    );
 }

}