import 'package:flutter/material.dart';
import 'package:cms_mobile/pages/dashboard_page.dart';
import 'package:cms_mobile/pages/contactos_page.dart';
import 'package:cms_mobile/pages/comunicaciones_page.dart';
import 'package:cms_mobile/pages/landings_page.dart';
import 'package:cms_mobile/pages/multimedia_page.dart';
import 'package:cms_mobile/pages/mailer_page.dart';
import 'package:cms_mobile/pages/configuracion_page.dart';
import 'package:cms_mobile/pages/login_page.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          top: 8 + MediaQuery.of(context).padding.top,
          bottom: 4,
          left: 22,
          right: 36,
        ),
        child: const Image(image: AssetImage('assets/images/logo.png')),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(12),
        child: Wrap(
          runSpacing: 2,
          children: [
            ListTile(
              leading: const Icon(Icons.dashboard_outlined),
              title: const Text('Dashboard'),
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const DashboardPage(),
              )),
            ),
            ListTile(
              leading: const Icon(Icons.group_outlined),
              title: const Text('Contactos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ContactosPage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.forward_to_inbox_outlined),
              title: const Text('Comunicaciones'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ComunicacionesPage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.monitor_outlined),
              title: const Text('Landings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LandingsPage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.perm_media_outlined),
              title: const Text('Multimedia'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MultimediaPage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.send_outlined),
              title: const Text('Mailer'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MailerPage(),
                ));
              },
            ),
            const Divider(color: Colors.black54),
            ListTile(
              leading: const Icon(Icons.settings_suggest_outlined),
              title: const Text('Configuración'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ConfiguracionPage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ));
              },
            ),
          ],
        ),
      );
}
