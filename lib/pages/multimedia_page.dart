import 'package:flutter/material.dart';
import 'package:cms_mobile/menu.dart' as my_menu;

class MultimediaPage extends StatelessWidget {
  const MultimediaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Multimedia'),
          backgroundColor: Colors.orange,
        ),
        drawer: const my_menu.NavigationDrawer(),
      );
}
