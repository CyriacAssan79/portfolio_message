import 'package:flutter/material.dart';
import 'package:portfolio_message/api/certificationAPI.dart';
import 'package:portfolio_message/data/certifications_data.dart';
import 'package:portfolio_message/data/diplome_data.dart';
import 'package:portfolio_message/model/certifications_model.dart';
import 'package:portfolio_message/view/widget/certifications_widget/form_certif.dart';
import 'package:portfolio_message/view/widget/certifications_widget/list_certifs.dart';

import '../../api/diplomeAPI.dart';
import '../../model/diplome_model.dart';
import '../../utils.dart';

class Certifications extends StatefulWidget {
  const Certifications({super.key, required this.type});

  final String type;

  @override
  State<Certifications> createState() => _CertificationsState();
}

class _CertificationsState extends State<Certifications> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController title_controller;
  late TextEditingController structure_controller;
  late TextEditingController date_controller;
  late TextEditingController url_controller;
  List<CertificationsModel> certifications_list = [];
  bool isLoading = false;
  List<CertificationsModel> diplomes_list = [];

  @override
  void initState() {
    title_controller = TextEditingController();
    structure_controller = TextEditingController();
    date_controller = TextEditingController();
    url_controller = TextEditingController();
    super.initState();
    callApi();
  }

  callApi() async {
    try {
      setState(() {
        isLoading = true;
      });
      final data = await CertificationAPI().callAPI();
      final diplomes = await DiplomeAPI().callAPI();
      setState(() {
        certifications_list = data.reversed.toList();
        diplomes_list = diplomes.reversed.toList();
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
    title_controller.dispose();
    structure_controller.dispose();
    date_controller.dispose();
    url_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text("${widget.type}", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ajouter ${widget.type == "Certifications"? "une certification" : "un diplôme"}",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 5),
                FormCertif(
                  formKey: _formKey,
                  title_controller: title_controller,
                  structure_controller: structure_controller,
                  date_controller: date_controller,
                  url_controller: url_controller,
                  type: widget.type,
                  savedCertif: savedCertif,
                ),
                Divider(),

                widget.type == "Certifications"
                    ? Text(
                        "Liste des certifications",
                        style: TextStyle(fontSize: 20),
                      )
                    : Text(
                        "Liste des diplômes",
                        style: TextStyle(fontSize: 20),
                      ),
                SizedBox(height: 10),
                widget.type == "Certifications"
                    ? isLoading
                          ? Center(child: CircularProgressIndicator())
                          : ListCertifs(
                              my_list: certifications_list,
                              removeCertif: remorveCertif,
                            )
                    : isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListCertifs(
                        my_list: diplomes_list,
                        removeCertif: remorveCertif,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void remorveCertif(CertificationsModel certif) {
    if (widget.type == "Certifications") {
      try {
        CertificationAPI().delCertification(certif.id).then((value) async {
          await callApi();
          AppSnackBar.show(
            context,
            message: "Certification supprimée avec succès!",
            type: SnackType.success,
          );
        });
      } catch (e) {
        AppSnackBar.show(
          context,
          message: "Erreur lors de la suppression de la certification! : ${e}",
          type: SnackType.success,
        );
      }
    }
    if (widget.type == "Diplômes") {
      try {
        DiplomeAPI().delDiplome(certif.id).then((value) async {
          await callApi();
          AppSnackBar.show(
            context,
            message: "Diplome supprimée avec succès!",
            type: SnackType.success,
          );
        });
      } catch (e) {
        AppSnackBar.show(
          context,
          message: "Erreur lors de la suppression du diplome! : ${e}",
          type: SnackType.success,
        );
      }
    }
  }

  void savedCertif() {
    if (_formKey.currentState!.validate()) {
      if (widget.type == "Certifications") {
        try {
          CertificationAPI()
              .savedCertification(
                title_controller.text,
                structure_controller.text,
                date_controller.text,
                url_controller.text,
              )
              .then((value) async {
                await callApi();

                AppSnackBar.show(
                  context,
                  message: "Certification enregistrée avec succès!",
                  type: SnackType.success,
                );

                title_controller.clear();
                structure_controller.clear();
                date_controller.clear();
                url_controller.clear();
              });
        } catch (e) {
          AppSnackBar.show(
            context,
            message:
                "Erreur lors de l'enregistrement de la certification! : ${e}",
            type: SnackType.error,
          );
        }
      }
      if (widget.type == "Diplômes") {
        try {
          DiplomeAPI()
              .savedDiplome(
                title_controller.text,
                structure_controller.text,
                date_controller.text,
                url_controller.text,
              )
              .then((value) async {
                await callApi();

                AppSnackBar.show(
                  context,
                  message: "Diplome enregistrée avec succès!",
                  type: SnackType.success,
                );

                title_controller.clear();
                structure_controller.clear();
                date_controller.clear();
                url_controller.clear();
              });
        } catch (e) {
          AppSnackBar.show(
            context,
            message: "Erreur lors de l'enregistrement du diplome! : ${e}",
            type: SnackType.error,
          );
        }
      }
    }
  }
}
