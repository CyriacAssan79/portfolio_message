import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController whattsapp_controller;
  late TextEditingController email_controller;
  late TextEditingController facebook_controller;
  late TextEditingController linkedin_controller;
  late TextEditingController github_controller;
  late TextEditingController tel_controller;

  @override
  void initState() {
    whattsapp_controller = TextEditingController();
    email_controller = TextEditingController();
    facebook_controller = TextEditingController();
    linkedin_controller = TextEditingController();
    github_controller = TextEditingController();
    tel_controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    whattsapp_controller.dispose();
    email_controller.dispose();
    facebook_controller.dispose();
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
                        controller: facebook_controller,
                        decoration: InputDecoration(
                          labelText: "Lien facebook",
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
                              "assets/facebook.png",
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
                        onPressed: () {},
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
}
