import 'package:flutter/material.dart';

import '../../data/temoignage_data.dart';
import '../../model/temoignage_model.dart';

class Temoignages extends StatefulWidget {
  const Temoignages({super.key});

  @override
  State<Temoignages> createState() => _TemoignagesState();
}

class _TemoignagesState extends State<Temoignages> {
  List<TemoignageModel> temoignage_list = TemoignageData().temoignage_list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temoignages", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Liste des temoignages", style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Column(
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
                      backgroundImage: AssetImage(temoi.photo),
                    )
                        : CircleAvatar(
                      backgroundColor: Colors.blue.shade800,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    onLongPress: (){
                      setState(() {
                        temoignage_list.remove(temoi);
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
