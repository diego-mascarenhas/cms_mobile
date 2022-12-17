import 'package:flutter/material.dart';
import 'package:cms_mobile/menu.dart';

class LandingsPage extends StatelessWidget {
  const LandingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Landings'),
          backgroundColor: Colors.brown,
        ),
        drawer: const NavigationDrawer(),
      );
}
