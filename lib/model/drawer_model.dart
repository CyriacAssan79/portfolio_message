import 'package:flutter/material.dart';

class DrawerModel {
  String title;
  IconData leading;
  Widget pages;

  DrawerModel({
    required this.title,
    required this.leading,
    required this.pages,
  });
}
