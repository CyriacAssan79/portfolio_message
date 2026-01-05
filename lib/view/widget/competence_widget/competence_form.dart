import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:portfolio_message/api/competenceAPI.dart';

class CompetenceForm extends StatefulWidget {
  const CompetenceForm({
    super.key,
    required this.formKey,
    required this.name_controller,
    required this.type_controller,
    required this.saved,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController name_controller;
  final TextEditingController type_controller;
  final Function saved;

  @override
  State<CompetenceForm> createState() => _CompetenceFormState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class _CompetenceFormState extends State<CompetenceForm> {
  late String dropdownValue;
  List<String> list = [
    "Langages de programmation",
    "Frameworks",
    "Outils & Technologies",
    "Bases de données",
  ];

  @override
  void initState() {
    super.initState();
    dropdownValue = list.first;
    widget.type_controller.text = dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
      list.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
    );

    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: widget.name_controller,
            decoration: InputDecoration(
              labelText: "Nom de la compétence",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue.shade800),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un nom de compétence';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          DropdownMenu<String>(
            initialSelection: dropdownValue,
            // 👈 IMPORTANT
            width: MediaQuery.of(context).size.width,
            label: const Text("Certifications"),
            onSelected: (String? value) {
              if (value == null) return;
              setState(() {
                dropdownValue = value;
                widget.type_controller.text = value;
              });
            },
            dropdownMenuEntries: menuEntries,
            inputDecorationTheme: InputDecorationTheme(
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
            onPressed: () {
              widget.saved();
              setState(() {
                dropdownValue = list.first;
                widget.type_controller.text = dropdownValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
