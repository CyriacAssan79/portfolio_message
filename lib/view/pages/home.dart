import 'package:flutter/material.dart';
import 'package:portfolio_message/api/APIService.dart';
import 'package:portfolio_message/model/messageModel.dart';
import 'package:portfolio_message/view/pages/read_message.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MessageModel> message = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    callApi();
  }

  callApi() async {
    try {
      final data = await ApiServices().callAPI();
      setState(() {
        message = data.reversed.toList();
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
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : message.isNotEmpty
          ? RefreshIndicator(
              child: ListView.custom(
                childrenDelegate: SliverChildBuilderDelegate((
                  BuildContext context,
                  int index,
                ) {
                  return Dismissible(
                    direction: DismissDirection.endToStart,
                    key: ValueKey<MessageModel>(message[index]),
                    onDismissed: (direction) {
                      // Récupère l'élément supprimé
                      MessageModel removedMessage = message[index];
                      // Affiche-le dans la console
                      print("Message supprimé : ${removedMessage.name}");
                      delMessage(removedMessage.id);
                      // Supprime-le de la liste pour mettre à jour l'UI
                      setState(() {
                        message.removeAt(index);
                      });
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 16.0),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(child: Icon(Icons.person)),
                      title: Text(
                        message[index].name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: message[index].state
                              ? FontWeight.normal
                              : FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        message[index].message,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: message[index].state
                              ? FontWeight.normal
                              : FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(Icons.navigate_next),
                      onTap: () {
                        if (message[index].state == false) {
                          setState(() {
                            message[index].state = true;
                          });
                        }
                        readMessage(message[index].id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) {
                              return ReadMessage(message: message[index]);
                            },
                          ),
                        );
                      },
                    ),
                  );
                }, childCount: message.length),
              ),
              onRefresh: () async {
                await callApi();
              },
            )
          : Center(child: Text("Aucun message")),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  readMessage(id) async {
    try {
      await ApiServices().readMessage(id);
    } catch (e) {
      print("Erreur API : $e");
    }
  }

  delMessage(id) async {
    try {
      await ApiServices().delMessage(id);
    } catch (e) {
      print("Erreur API : $e");
    }
  }
}
