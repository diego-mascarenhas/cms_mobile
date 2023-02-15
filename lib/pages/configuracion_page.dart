import 'package:flutter/material.dart';
import 'package:cms_mobile/pages/mailer_smtps_envios_por_dominio_page.dart';
import 'package:cms_mobile/pages/mailer_smtps_page.dart';
import 'package:cms_mobile/pages/trade_signals_page.dart';

import 'package:cms_mobile/pages/gestion_static_page.dart';

class ConfiguracionPage extends StatelessWidget {
  const ConfiguracionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Emails en Cola'),
            subtitle: const Text('SMTPs'),
            trailing: const Icon(Icons.keyboard_arrow_right_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SmtpsPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Envíos por Dominio'),
            subtitle: const Text('SMTPs'),
            trailing: const Icon(Icons.keyboard_arrow_right_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SmtpsEnviosPorDominioPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Trade Signals'),
            subtitle: const Text('Señales de Compra y Venta'),
            trailing: const Icon(Icons.keyboard_arrow_right_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TradeSignalsPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Gestión'),
            subtitle: const Text('Balances'),
            trailing: const Icon(Icons.keyboard_arrow_right_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GestionPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
