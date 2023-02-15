import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cms_mobile/menu.dart';
import 'package:cms_mobile/pages/users_login_page.dart';
import 'package:cms_mobile/pages/users_logout_page.dart';
import 'package:cms_mobile/pages/servicios_page.dart';
import 'package:cms_mobile/pages/facturas_page.dart';
import 'package:cms_mobile/pages/tickets_page.dart';

enum MenuItem { item1, item2, item3, item4 }

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String token = '';
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    getCred();
  }

  void getCred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString('login')!;

      setState(() {
        isLogin = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          //backgroundColor: Colors.transparent,
          //elevation: 0,
          actions: isLogin
              ? [
                  IconButton(
                    icon: const Icon(Icons.notifications_none),
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
                              builder: (context) => const TicketsPage()));
                        } else if (value == MenuItem.item4) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LogoutPage()));
                        }
                      },
                      itemBuilder: (context) => const [
                            PopupMenuItem(
                              value: MenuItem.item1,
                              child: Text('Servicios'),
                            ),
                            PopupMenuItem(
                              value: MenuItem.item2,
                              child: Text('Facturas'),
                            ),
                            PopupMenuItem(
                              value: MenuItem.item3,
                              child: Text('Tickets'),
                            ),
                            PopupMenuItem(
                              value: MenuItem.item4,
                              child: Text('Logout'),
                            ),
                          ])
                ]
              : [
                  IconButton(
                    icon: const Icon(Icons.login_outlined),
                    onPressed: () async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      await pref.clear();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                          (route) => false);
                    },
                  )
                ],
        ),
        drawer: const NavigationDrawer(),
        body: MyWidget());
  }
}

class MyWidget extends StatelessWidget {
  final urlImage =
      'https://www.revisionalpha.es/assets/img/slider/marketing-digital.jpg';

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: <Widget>[
        Center(
          child: Image.network(
            urlImage,
            height: 400,
            width: 400,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
