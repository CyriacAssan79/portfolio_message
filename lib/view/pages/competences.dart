import 'package:flutter/material.dart';
import 'package:portfolio_message/api/competenceAPI.dart';
import 'package:portfolio_message/view/widget/competence_widget/competence_form.dart';

import '../../model/competence_model.dart';
import '../../utils.dart';
import '../widget/competence_widget/competence_list.dart';

class Competences extends StatefulWidget {
  const Competences({super.key});

  @override
  State<Competences> createState() => _CompetencesState();
}

class _CompetencesState extends State<Competences> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController name_controller;
  late TextEditingController type_controller;
  List<CompetenceModel> competence_list = [];
  bool isLoading = false;

  @override
  void initState() {
    name_controller = TextEditingController();
    type_controller = TextEditingController();
    super.initState();
    callApi();
  }

  callApi() async {
    try {
      final data = await CompetenceAPI().callAPI();
      setState(() {
        competence_list = data.reversed.toList();
        isLoading = false;
      });
    } catch (e) {
      print("Erreur API : $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    name_controller.dispose();
    type_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text("Mes compétences", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 10, right: 10, top: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enregistre une de tes compétences",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                CompetenceForm(
                  formKey: _formKey,
                  name_controller: name_controller,
                  type_controller: type_controller,
                  saved: saved,
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Text("Liste des compétences", style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                CompetenceList(
                  competence_list: competence_list,
                  delete: delete,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void delete(CompetenceModel competence) async {
    try {
      CompetenceAPI().delCompetence(competence.id).then((value) async {
        await callApi();
        AppSnackBar.show(
          context,
          message: "Compétence supprimée avec succès !",
          type: SnackType.success,
        );
      });
    } catch (e) {
      AppSnackBar.show(
        context,
        message: "Erreur lors de la suppression de la compétence !${e}",
        type: SnackType.error,
      );
    }
  }

  void saved() async {
    if (_formKey.currentState!.validate()) {
      try {
        CompetenceAPI()
            .savedCompetence(name_controller.text, type_controller.text)
            .then((value) async {
              await callApi();
              AppSnackBar.show(
                context,
                message: "Compétence enregistrée avec succès!",
                type: SnackType.success,
              );
              name_controller.clear();
            });
      } catch (e) {
        AppSnackBar.show(
          context,
          message: "Erreur lors de l'enregistrement de la compétence! : ${e}",
          type: SnackType.error,
        );
      }
    }
  }
}
