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
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        title: Container(
          child: UiHelper.HomeAScreenTopBar(),
        ),
        backgroundColor: Colors.yellow.shade100,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
          child: ListView.builder(itemBuilder: (context, index) {
            return UiHelper.CustomListTile();
          },
          ),
        ),
      ),
    );
  }
}
