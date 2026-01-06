import 'package:flutter/material.dart';
import 'package:portfolio_message/api/socialAPI.dart';
import '../../model/social_model.dart';
import '../../utils.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController whattsapp_controller;
  late TextEditingController email_controller;
  late TextEditingController linkedin_controller;
  late TextEditingController github_controller;
  late TextEditingController tel_controller;
  List<SocialModal> social = [];
  bool isLoading = false;

  @override
  void initState() {
    whattsapp_controller = TextEditingController();
    email_controller = TextEditingController();
    linkedin_controller = TextEditingController();
    github_controller = TextEditingController();
    tel_controller = TextEditingController();
    super.initState();
    callApi();
  }

  callApi() async {
    try {
      final data = await SocialAPI().callAPI();
      setState(() {
        social = data.reversed.toList();
        whattsapp_controller.text = social[0].wha;
        email_controller.text = social[0].email;
        linkedin_controller.text = social[0].lk;
        github_controller.text = social[0].github;
        tel_controller.text = social[0].tel;
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
    whattsapp_controller.dispose();
    email_controller.dispose();
    linkedin_controller.dispose();
    github_controller.dispose();
    tel_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text("Contacts", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Renseigner votre formulaires de contact",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: whattsapp_controller,
                        decoration: InputDecoration(
                          labelText: "Numéro whattsapp",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.green.shade800,
                              width: 2,
                            ),
                          ),
                          prefixIcon: Container(
                            padding: EdgeInsets.all(6),
                            child: Image.asset(
                              "assets/wha.png",
                              width: 5,
                              height: 5,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: email_controller,
                        decoration: InputDecoration(
                          labelText: "Adresse email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue.shade800,
                              width: 2,
                            ),
                          ),
                          prefixIcon: Container(
                            padding: EdgeInsets.all(6),
                            child: Image.asset(
                              "assets/gmail.png",
                              width: 5,
                              height: 5,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      TextFormField(
                        controller: linkedin_controller,
                        decoration: InputDecoration(
                          labelText: "Lien linkedin",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue.shade800,
                              width: 2,
                            ),
                          ),
                          prefixIcon: Container(
                            padding: EdgeInsets.all(6),
                            child: Image.asset(
                              "assets/linkedin.png",
                              width: 5,
                              height: 5,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: github_controller,
                        decoration: InputDecoration(
                          labelText: "Lien github",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue.shade800,
                              width: 2,
                            ),
                          ),
                          prefixIcon: Container(
                            padding: EdgeInsets.all(6),
                            child: Image.asset(
                              "assets/github.png",
                              width: 5,
                              height: 5,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: tel_controller,
                        decoration: InputDecoration(
                          labelText: "Numéro de téléphone",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue.shade800,
                              width: 2,
                            ),
                          ),
                          prefixIcon: Container(
                            padding: EdgeInsets.all(6),
                            child: Image.asset(
                              "assets/appel.png",
                              width: 5,
                              height: 5,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade800,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text("Enregistrer"),
                        onPressed: savedContact,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void savedContact() async {
    if (_formKey.currentState!.validate()) {
      try {
        SocialAPI()
            .updatedSocial(
              social[0].id,
              whattsapp_controller.text,
              email_controller.text,
              linkedin_controller.text,
              github_controller.text,
              tel_controller.text,
            )
            .then((value) async {
              await callApi();
              AppSnackBar.show(
                context,
                message: "Mise à jour effectuée avec succès!",
                type: SnackType.success,
              );
        });
      } catch (e) {
        AppSnackBar.show(
          context,
          message: "Erreur lors de la mise à jour des données!",
          type: SnackType.error,
        );
      }
    }
  }
}
