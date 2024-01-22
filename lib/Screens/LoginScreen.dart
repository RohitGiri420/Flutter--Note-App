import 'package:flutter/material.dart';
import 'package:notesapp/Widget/UIHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  String? Email;
  String? Password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomTextField(
                Hint: "Email",
                controller: emailcontroller,
                icon: Icons.email_outlined,
                obscure: false),
            UiHelper.CustomTextField(
                Hint: "Password",
                controller: passcontroller,
                icon: Icons.lock_open_rounded,
                obscure: true),
            UiHelper.CustomLoginButton(() => setData()),
          ],
        ),
      ),
    );
  }

  setData() async{
    SharedPreferences preffs = await SharedPreferences.getInstance();

    Email = emailcontroller.text.toString();
    Password = passcontroller.text.toString();

    preffs.setString("Email", Email!);
    preffs.setString("Password", Password!);
  }

}
