import 'package:flutter/material.dart';

class Diplome extends StatefulWidget {
  const Diplome({super.key});

  @override
  State<Diplome> createState() => _DiplomeState();
}

class _DiplomeState extends State<Diplome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text("Diplômes", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(),
    );
  }
}
