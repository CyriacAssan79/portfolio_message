import 'package:flutter/material.dart';
import 'package:portfolio_message/view/widget/profil_widget/down_load.dart';
import 'package:portfolio_message/view/widget/profil_widget/photo.dart';
import 'package:portfolio_message/view/widget/profil_widget/profil_form.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade800,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
      ),
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Photo()),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "Assan Cyriac",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                DownLoad(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Divider(),
                ),
                Text(
                  "Bio",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Je conçois des applications modernes, performantes et adaptées à vos besoins.",
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Divider(),
                ),
                Text(
                  "Modifier mes informations",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ProfilForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
