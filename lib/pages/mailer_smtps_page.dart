import 'package:flutter/material.dart';
import 'package:cms_mobile/models/smtpModel.dart';
import 'package:cms_mobile/data/smtps.dart';

import 'package:http/http.dart' as http;

class SmtpsPage extends StatelessWidget {
  const SmtpsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('SMTPs'),
        ),
        body: FutureBuilder<List<Smtp>>(
          future: fetchItems(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              return SmtpsList(Item: snapshot.data!);
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
  const SmtpsList({super.key, required this.Item});

  final List<Smtp> Item;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Item.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(Item[index].host),
          subtitle: Text('ID: ' + Item[index].id.toString()),
        );
      },
    );
  }
}
