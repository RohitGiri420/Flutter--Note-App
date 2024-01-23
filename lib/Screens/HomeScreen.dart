import 'package:flutter/material.dart';
import 'package:notesapp/Widget/UIHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
              UiHelper.CustomHeading()
          ],
        ),
      ),
    );
  }
}
