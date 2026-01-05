import 'package:flutter/material.dart';
import 'package:portfolio_message/data/service_data.dart';
import 'package:portfolio_message/model/service_model.dart';
import 'package:portfolio_message/view/widget/service_widget/form_service.dart';
import 'package:portfolio_message/view/widget/service_widget/service_list.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController title_controller;
  late TextEditingController description_controller;
  late TextEditingController icon_controller;
  List<ServiceModel> services_list = ServiceData().service;

  @override
  void initState() {
    title_controller = TextEditingController();
    description_controller = TextEditingController();
    icon_controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    title_controller.dispose();
    description_controller.dispose();
    icon_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Services proposés",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade800,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ajoute un service que tu proposes",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                FormService(
                  formKey: _formKey,
                  title_controller: title_controller,
                  description_controller: description_controller,
                  icon_controller: icon_controller,
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Text(
                  "Liste des services proposés",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                ServiceList(
                  services_list: services_list,
                  delete: delete,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void delete(ServiceModel service) {
    setState(() {
      services_list.remove(service);
    });
  }
}
