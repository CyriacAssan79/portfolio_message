import 'package:flutter/material.dart';

import '../../data/drawerData.dart';
import '../../model/drawer_model.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<DrawerModel> drawer_data = DrawerData().drawer_list;

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blue.shade800),
            accountName: Text("Assan Cyriac"),
            accountEmail: Text("atchue2002@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/profil.png"),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: drawer_data.map((data) {
                  return ListTile(
                    leading: Icon(data.leading,color: Colors.blue.shade800),
                    title: Text(data.title,style: TextStyle(color: Colors.blue.shade800)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => data.pages),
                      );
                    },
                    trailing: Icon(Icons.next_plan_outlined,color: Colors.blue.shade800),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
