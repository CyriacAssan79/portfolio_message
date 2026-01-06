import 'package:flutter/material.dart';
import 'package:portfolio_message/api/serviceAPI.dart';
import 'package:portfolio_message/model/service_model.dart';
import 'package:portfolio_message/view/widget/service_widget/form_service.dart';
import 'package:portfolio_message/view/widget/service_widget/service_list.dart';

import '../../utils.dart';

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
  List<ServiceModel> services_list = [];
  bool isLoading = false;


  @override
  void initState() {
    title_controller = TextEditingController();
    description_controller = TextEditingController();
    icon_controller = TextEditingController();
    super.initState();
    callApi();
  }

  callApi() async {
    try {
      setState(() {
        isLoading = true;
      });
      final data = await ServiceAPI().callAPI();
      setState(() {
        services_list = data.reversed.toList();
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
                  savedService: savedService,
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Text(
                  "Liste des services proposés",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                isLoading ? Center(child: CircularProgressIndicator()) :
                ServiceList(services_list: services_list, delete: delete),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void delete(ServiceModel service) {
    try {
      ServiceAPI()
          .delService(service.id
      )
          .then((value) async {
        await callApi();
        AppSnackBar.show(
          context,
          message: "Service supprimée avec succès!",
          type: SnackType.success,
        );
      });
    } catch (e) {
      AppSnackBar.show(
        context,
        message: "Erreur lors de la suppression du service!",
        type: SnackType.error,
      );
    }
  }

  void savedService() async {
    if (_formKey.currentState!.validate()) {
      try {
        ServiceAPI()
            .savedService(
              title_controller.text,
              description_controller.text,
              icon_controller.text,
            )
            .then((value) async {
              await callApi();
              AppSnackBar.show(
                context,
                message: "Service enregistrée avec succès!",
                type: SnackType.success,
              );

              title_controller.clear();
              description_controller.clear();
              icon_controller.clear();
            });
      } catch (e) {
        AppSnackBar.show(
          context,
          message: "Erreur lors de l'enregistrement du service!",
          type: SnackType.error,
        );
      }
    }
  }
}
