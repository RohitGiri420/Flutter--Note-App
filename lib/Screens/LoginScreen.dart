import 'package:flutter/material.dart';
import 'package:notesapp/Widget/UIHelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("LOGIN"),
          UiHelper.CustomTextField(),
        ],
      ),

    );
  }
}
