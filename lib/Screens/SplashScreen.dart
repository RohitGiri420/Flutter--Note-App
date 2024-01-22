import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notesapp/Screens/HomeScreen.dart';
import 'package:notesapp/Screens/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String? Email;
  String? Password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

    Timer(Duration(seconds: 4), () {
      if(Email==null||Password==null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('asset/lottie/SplashScreenAnimation.json'),
          SizedBox(height: 10,)
        ],
      ),
    );
  }

  getData() async{
    SharedPreferences preffs = await SharedPreferences.getInstance();
    Email = await preffs.getString("Email");
    Password = await preffs.getString("Password");
  }
}
