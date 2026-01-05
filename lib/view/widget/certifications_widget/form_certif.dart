import 'dart:collection';

import 'package:flutter/material.dart';

class FormCertif extends StatefulWidget {
  const FormCertif({
    super.key,
    required this.formKey,
    required this.title_controller,
    required this.structure_controller,
    required this.date_controller,
    required this.url_controller,
    required this.type,
    required this.savedCertif,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController title_controller;
  final TextEditingController structure_controller;
  final TextEditingController date_controller;
  final TextEditingController url_controller;
  final String type;
  final Function savedCertif;

  @override
  State<FormCertif> createState() => _FormCertifState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class _FormCertifState extends State<FormCertif> {
  @override
  Widget build(BuildContext context) {
    List<String> list = widget.type == "Diplôme"
        ? <String>["Diplôme", "Certification"]
        : <String>["Certification", "Diplôme"];
    final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
      list.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
    );
    String dropdownValue = list.first;
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: widget.title_controller,
            decoration: InputDecoration(
              labelText: "Titre",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue.shade800, width: 2),
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
            controller: widget.structure_controller,
            decoration: InputDecoration(
              labelText: "Nom de la tructure",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue.shade800, width: 2),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un nom de structure';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: widget.date_controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Année",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue.shade800, width: 2),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez saisir une date';
              }
              if (int.tryParse(value) == null) {
                return 'Veuillez saisir une année valide';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: widget.url_controller,
            decoration: InputDecoration(
              labelText: "URL de la certification",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue.shade800, width: 2),
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
            onPressed: (){
              widget.savedCertif();
            },
          ),
        ],
      ),
    );
  }
}




/*
DropdownMenu<String>(
            initialSelection: list.first,
            width: MediaQuery.of(context).size.width,
            label: Text("Certifications"),
            onSelected: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            dropdownMenuEntries: menuEntries,
              inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue.shade800),
                  )
              )
          ),
          SizedBox(height: 10),
 */