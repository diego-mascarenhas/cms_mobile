import 'package:flutter/material.dart';
import 'package:cms_mobile/models/factura_model.dart';
import 'package:cms_mobile/data/facturas.dart';

import 'package:http/http.dart' as http;

class FacturasPage extends StatelessWidget {
  const FacturasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Facturas'),
        ),
        body: FutureBuilder<List<Factura>>(
          future: fetchItems(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              return FacturasList(item: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFed5565)),
              );
            }
          },
        ),
      );
}

class FacturasList extends StatelessWidget {
  const FacturasList({super.key, required this.item});

  final List<Factura> item;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: item.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${item[index].comprobante} ${item[index].total}'),
          subtitle: Text(
              item[index].fecha), // Text('ID: ' + Item[index].id.toString()),
        );
      },
    );
  }
}
