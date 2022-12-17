import 'package:flutter/material.dart';
import 'package:cms_mobile/menu.dart';

class MailerPage extends StatelessWidget {
  const MailerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Mailer'),
          backgroundColor: Colors.green,
        ),
        drawer: const NavigationDrawer(),
      );
}
