import 'package:flutter/material.dart';

import '../../../model/service_model.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({super.key, required this.services_list, required this.delete});

  final List<ServiceModel> services_list;
  final Function delete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: services_list.map((services) {
        return ListTile(
          title: Text(
            services.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            services.desciption,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey.shade700),
          ),
          onLongPress: (()=>delete(services)),
        );
      }).toList(),
    );
  }
}
