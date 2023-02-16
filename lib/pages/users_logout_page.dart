import 'package:cms_mobile/main.dart';
import 'package:cms_mobile/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cms_mobile/menu.dart' as my_menu;

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
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
        title: const Text('Logout'),
      ),
      drawer: const my_menu.NavigationDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Bienvenido!",
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Token: $token",
                ),
                SizedBox(
                  height: 15,
                ),
                OutlinedButton.icon(
                  onPressed: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    await pref.clear();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const DashboardPage(
                                //title: 'Home!',
                                )),
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
