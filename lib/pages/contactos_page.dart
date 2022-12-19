import 'package:flutter/material.dart';
import 'package:cms_mobile/models/contactoModel.dart';
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
              return ContactosList(Item: snapshot.data!);
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
  const ContactosList({super.key, required this.Item});

  final List<Contacto> Item;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Item.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(Item[index].nombre + ' ' + Item[index].apellido),
          subtitle: Text(
              Item[index].email), // Text('ID: ' + Item[index].id.toString()),
        );
      },
    );
  }
}
