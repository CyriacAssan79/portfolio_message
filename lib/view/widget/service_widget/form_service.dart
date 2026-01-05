import 'package:flutter/material.dart';

class FormService extends StatelessWidget {
  const FormService({
    super.key,
    required this.formKey,
    required this.title_controller,
    required this.description_controller,
    required this.icon_controller,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController title_controller;
  final TextEditingController description_controller;
  final TextEditingController icon_controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: title_controller,
            decoration: InputDecoration(
              labelText: "Titre du service",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue.shade800),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un titre';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: icon_controller,
            decoration: InputDecoration(
              labelText: "Coller le lien de l'icone",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue.shade800),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer une icone';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: description_controller,
            maxLines: 5,
            maxLength: 200,
            decoration: InputDecoration(
              labelText: "Description du service",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue.shade800),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer une description';
              }
              return null;
            },
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
            onPressed: (){
              if (formKey.currentState!.validate()) {
                print("Titre : ${title_controller.text}");
                print("Description : ${description_controller.text}");

                title_controller.clear();
                description_controller.clear();
                icon_controller.clear();
              }
            },
            child: Text("Enregistrer"),
          )
        ],
      ),
    );
  }
}
