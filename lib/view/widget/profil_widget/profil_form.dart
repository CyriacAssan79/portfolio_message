import 'package:flutter/material.dart';

class ProfilForm extends StatefulWidget {
  const ProfilForm({super.key});

  @override
  State<ProfilForm> createState() => _ProfilFormState();
}

class _ProfilFormState extends State<ProfilForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController name_controller;
  late TextEditingController email_controller;
  late TextEditingController bio_controller;

  @override
  void initState() {
    name_controller = TextEditingController();
    email_controller = TextEditingController();
    bio_controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    name_controller.dispose();
    email_controller.dispose();
    bio_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: name_controller,
            decoration: InputDecoration(
              labelText: "Nom",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue.shade800),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un nom';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: email_controller,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue.shade800),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            maxLines: 5,
            maxLength: 200,
            controller: bio_controller,
            decoration: InputDecoration(
              labelText: "Bio",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue.shade800),
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
    );
  }
}
