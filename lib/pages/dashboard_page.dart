import 'package:flutter/material.dart';
import 'package:cms_mobile/menu.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          backgroundColor: Colors.red,
        ),
        drawer: const NavigationDrawer(),
      );
}
