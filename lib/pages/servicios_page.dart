import 'package:flutter/material.dart';
import 'package:cms_mobile/models/servicio_model.dart';
import 'package:cms_mobile/data/servicios.dart';

import 'package:http/http.dart' as http;

class ServiciosPage extends StatelessWidget {
  const ServiciosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Servicios'),
        ),
        body: FutureBuilder<List<Servicio>>(
          future: fetchItems(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              return ServiciosList(item: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFed5565)),
              );
            }
          },
        ),
      );
}

class ServiciosList extends StatelessWidget {
  const ServiciosList({super.key, required this.item});

  final List<Servicio> item;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: item.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${item[index].descripcion} ${item[index].descripcion}'),
          subtitle: Text(
              item[index].total), // Text('ID: ' + Item[index].id.toString()),
        );
      },
    );
  }
}
