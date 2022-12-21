import 'package:flutter/material.dart';
import 'package:cms_mobile/menu.dart';

class MailerPage extends StatefulWidget {
  const MailerPage({Key? key}) : super(key: key);

  @override
  State<MailerPage> createState() => _MailerPageState();
}

class _MailerPageState extends State<MailerPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Mailer'),
          backgroundColor: Colors.green,
        ),
        drawer: const NavigationDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.send),
              label: 'Mensajes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Listas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.poll),
              label: 'Plantillas',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      );
}
