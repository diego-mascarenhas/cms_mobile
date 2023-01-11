import 'package:flutter/material.dart';
import 'package:cms_mobile/models/mailer_mensaje_model.dart';
import 'package:cms_mobile/data/mailer_mensajes.dart';

import 'package:http/http.dart' as http;

class MailerMensajesPage extends StatelessWidget {
  const MailerMensajesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<List<Mensajes>>(
          future: fetchItems(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              return MensajesList(item: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFed5565)),
              );
            }
          },
        ),
      );
}

class MensajesList extends StatelessWidget {
  const MensajesList({super.key, required this.item});

  final List<Mensajes> item;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: item.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${item[index].asunto} ${item[index].lista}'),
          subtitle: Text(item[index]
              .template), // Text('ID: ' + Item[index].id.toString()),
        );
      },
    );
  }
}
