import 'package:flutter/material.dart';
import 'package:cms_mobile/models/smtp_envios_por_dominio_model.dart';
import 'package:cms_mobile/data/smtp_envios_por_dominio.dart';

import 'package:http/http.dart' as http;

class SmtpsEnviosPorDominioPage extends StatelessWidget {
  const SmtpsEnviosPorDominioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Envíos por Dominio'),
        ),
        body: FutureBuilder<List<Smtp>>(
          future: fetchItems(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              return SmtpsList(item: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFed5565)),
              );
            }
          },
        ),
      );
}

class SmtpsList extends StatelessWidget {
  const SmtpsList({super.key, required this.item});

  final List<Smtp> item;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: item.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(item[index].dominio),
          subtitle: Text('Envíos: ${item[index].envios}'),
        );
      },
    );
  }
}
