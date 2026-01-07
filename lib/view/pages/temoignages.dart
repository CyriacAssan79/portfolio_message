import 'package:flutter/material.dart';
import 'package:portfolio_message/api/temoignageAPI.dart';

import '../../data/temoignage_data.dart';
import '../../model/temoignage_model.dart';
import '../../utils.dart';

class Temoignages extends StatefulWidget {
  const Temoignages({super.key});

  @override
  State<Temoignages> createState() => _TemoignagesState();
}

class _TemoignagesState extends State<Temoignages> {
  List<TemoignageModel> temoignage_list = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    callAPI();
  }

  callAPI() async {
    try {
      setState(() {
        isLoading = true;
      });
      final datas = await TemoignageAPI().callAPI();
      setState(() {
        temoignage_list = datas.reversed.toList();
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temoignages", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Liste des temoignages", style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      children: temoignage_list.map((temoi) {
                        return ListTile(
                          title: Row(
                            children: [
                              Text(
                                temoi.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  temoi.email,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(temoi.message),
                          leading: temoi.photo.isNotEmpty
                              ? CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(temoi.photo),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.blue.shade800,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                ),
                          onLongPress: (() => deleteTemoignage(temoi.id)),
                        );
                      }).toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void deleteTemoignage(id) async {
    try {
      await TemoignageAPI().delTemoignage(id).then((value) async {
        await callAPI();
        AppSnackBar.show(
          context,
          message: "Le temoignage a été supprimé!",
          type: SnackType.success,
        );
      });
    } catch (e) {
      AppSnackBar.show(
        context,
        message: "Erreur lors de la suppression du temoignage!",
        type: SnackType.error,
      );
    }
  }
}
