import 'package:flutter/material.dart';
import 'package:portfolio_message/model/drawer_model.dart';
import 'package:portfolio_message/view/pages/certifications.dart';
import 'package:portfolio_message/view/pages/competences.dart';
import 'package:portfolio_message/view/pages/contacts.dart';
import 'package:portfolio_message/view/pages/home.dart';
import 'package:portfolio_message/view/pages/profil.dart';
import 'package:portfolio_message/view/pages/services.dart';
import 'package:portfolio_message/view/pages/temoignages.dart';

class DrawerData {

  static const List<String> list = <String>['Diplômes', 'Certifications'];
  List<DrawerModel> drawer_list = [
    DrawerModel(
      title: "Profil",
      leading: Icons.account_circle_outlined,
      pages: Profil(),
    ),
    DrawerModel(
      title: "Mes compétences",
      leading: Icons.check,
      pages: Competences(),
    ),
    DrawerModel(
      title: "Messages",
      leading: Icons.message_outlined,
      pages: MyHomePage(title: "Mes messages portfolio"),
    ),
    DrawerModel(
      title: "Certifications",
      leading: Icons.checklist,
      pages: Certifications(type : list[1]),
    ),
    DrawerModel(
      title: "Diplômes",
      leading: Icons.school_outlined,
      pages: Certifications(type : list[0]),
    ),
    DrawerModel(
      title: "Projets",
      leading: Icons.search,
      pages: Container(),
    ),
    DrawerModel(
      title: "Services",
      leading: Icons.work_outline,
      pages: Services(),
    ),
    DrawerModel(
      title: "Témoignages",
      leading: Icons.live_help_outlined,
      pages: Temoignages(),
    ),
    DrawerModel(
      title: "Contacts",
      leading: Icons.call,
      pages: Contacts(),
    ),
  ];
}
