import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cms_mobile/menu.dart';
import 'package:cms_mobile/pages/login_page.dart';
import 'package:cms_mobile/pages/comunicaciones_page.dart';
import 'package:cms_mobile/pages/servicios_page.dart';
import 'package:cms_mobile/pages/facturas_page.dart';

enum MenuItem { item1, item2, item3 }

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String token = '';

  @override
  void initState() {
    super.initState();
    getCred();
  }

  void getCred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString('login')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        //backgroundColor: Colors.transparent,
        //elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () {},
          ),
          PopupMenuButton<MenuItem>(
              onSelected: (value) {
                if (value == MenuItem.item1) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ServiciosPage()));
                } else if (value == MenuItem.item2) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FacturasPage()));
                } else if (value == MenuItem.item3) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ComunicacionesPage()));
                }
              },
              itemBuilder: (context) => const [
                    PopupMenuItem(
                      value: MenuItem.item1,
                      child: Text('Servicios'),
                    ),
                    PopupMenuItem(
                      value: MenuItem.item2,
                      child: Text('Mis Facturas'),
                    ),
                    PopupMenuItem(
                      value: MenuItem.item3,
                      child: Text('Crear Ticket'),
                    ),
                  ])
        ],
      ),
      drawer: const NavigationDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  "Bienvenido!",
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Token: $token",
                ),
                const SizedBox(
                  height: 15,
                ),
                OutlinedButton.icon(
                  onPressed: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    await pref.clear();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (route) => false);
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Salir'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
