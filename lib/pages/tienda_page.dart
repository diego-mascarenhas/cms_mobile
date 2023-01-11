import 'package:flutter/material.dart';
import 'package:cms_mobile/menu.dart';

class TiendaPage extends StatelessWidget {
  const TiendaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Tienda'),
          backgroundColor: Colors.green,
        ),
        drawer: const NavigationDrawer(),
      );
}
