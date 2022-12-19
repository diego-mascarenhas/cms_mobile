import 'package:flutter/material.dart';
import 'package:cms_mobile/menu.dart';

import 'package:cms_mobile/data/smtps.dart';
import 'package:cms_mobile/models/smtpModel.dart';

import 'package:http/http.dart' as http;

class SmtpsPage extends StatefulWidget {
  const SmtpsPage({Key? key}) : super(key: key);

  @override
  State<SmtpsPage> createState() => _SmtpsPageState();
}

class _SmtpsPageState extends State<SmtpsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMTPs'),
      ),
      drawer: const NavigationDrawer(),
    );
  }
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
          title: Text(item[index].host),
          subtitle: Text("Mails en Cola: " + item[index].mailq.toString()),
        );
      },
    );
  }
}
