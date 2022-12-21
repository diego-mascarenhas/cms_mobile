import 'package:flutter/material.dart';
import 'package:cms_mobile/models/contacto_model.dart';
import 'package:cms_mobile/data/contactos.dart';

import 'package:http/http.dart' as http;

class ContactosPage extends StatelessWidget {
  const ContactosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Contactos'),
        ),
        body: FutureBuilder<List<Contacto>>(
          future: fetchItems(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              return ContactosList(item: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFed5565)),
              );
            }
          },
        ),
      );
}

class ContactosList extends StatelessWidget {
  const ContactosList({super.key, required this.item});

  final List<Contacto> item;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: item.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${item[index].nombre} ${item[index].apellido}'),
          subtitle: Text(
              item[index].email), // Text('ID: ' + Item[index].id.toString()),
        );
      },
    );
  }
}
