import 'package:flutter/material.dart';

class DownLoad extends StatelessWidget {
  const DownLoad({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.camera_alt, color: Colors.blue.shade800),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.photo, color: Colors.blue.shade800),
        ),
      ],
    );
  }
}
