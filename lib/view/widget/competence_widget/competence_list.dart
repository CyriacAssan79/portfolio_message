import 'package:flutter/material.dart';

import '../../../model/competence_model.dart';

class CompetenceList extends StatelessWidget {
  const CompetenceList({super.key, required this.competence_list, required this.delete});

  final List<CompetenceModel> competence_list;
  final Function(CompetenceModel) delete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset("assets/code.png", width: 35, height: 35),
            SizedBox(width: 10),
            Text(
              "Langages de programmation",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
        Column(
          children: competence_list.map((competence) {
            if (competence.type == "Langages de programmation") {
              return ListTile(
                leading: Icon(Icons.linear_scale),
                title: Text(competence.name),
                trailing: IconButton(
                  onPressed: () => delete(competence),
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              );
            }
            return Container();
          }).toList(),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Image.asset("assets/couche.png", width: 30, height: 30),
            SizedBox(width: 15),
            Text(
              "Frameworks",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
        Column(
          children: competence_list.map((competence) {
            if (competence.type == "Frameworks") {
              return ListTile(
                leading: Icon(Icons.linear_scale),
                title: Text(competence.name),
                trailing: IconButton(
                  onPressed: () => delete(competence),
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              );
            }
            return Container();
          }).toList(),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Image.asset("assets/cle.png", width: 30, height: 30),
            SizedBox(width: 15),
            Text(
              "Outils & Technologies",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
        Column(
          children: competence_list.map((competence) {
            if (competence.type == "Outils & Technologies") {
              return ListTile(
                leading: Icon(Icons.linear_scale),
                title: Text(competence.name),
                trailing: IconButton(
                  onPressed: () => delete(competence),
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              );
            }
            return Container();
          }).toList(),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Image.asset("assets/bds.png", width: 30, height: 30),
            SizedBox(width: 15),
            Text(
              "Bases de données",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10),
        Column(
          children: competence_list.map((competence) {
            if (competence.type == "Bases de données") {
              return ListTile(
                leading: Icon(Icons.linear_scale),
                title: Text(competence.name),
                trailing: IconButton(
                  onPressed: () => delete(competence),
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              );
            }
            return Container();
          }).toList(),
        ),
      ],
    );
  }
}
