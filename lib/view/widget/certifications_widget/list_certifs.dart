import 'package:flutter/material.dart';

import '../../../model/certifications_model.dart';

class ListCertifs extends StatelessWidget {
  const ListCertifs({super.key, required this.my_list, required this.removeCertif});
  final List<CertificationsModel> my_list;
  final Function removeCertif;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: my_list.map((certifs) {
        return ListTile(
          title: Text(
            certifs.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(certifs.structure),
          trailing: Text(
            certifs.annee.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onLongPress: (){
            removeCertif(certifs);
          },
        );
      }).toList(),
    );
  }
}
