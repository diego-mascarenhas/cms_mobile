import 'package:flutter/material.dart';
import 'package:cms_mobile/models/ticket_model.dart';
import 'package:cms_mobile/data/tickets.dart';

import 'package:http/http.dart' as http;

class TicketsPage extends StatelessWidget {
  const TicketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Tickets'),
        ),
        body: FutureBuilder<List<Ticket>>(
          future: fetchItems(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              return TicketsList(item: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFed5565)),
              );
            }
          },
        ),
      );
}

class TicketsList extends StatelessWidget {
  const TicketsList({super.key, required this.item});

  final List<Ticket> item;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: item.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${item[index].asunto} ${item[index].asunto}'),
          subtitle: Text(
              item[index].area), // Text('ID: ' + Item[index].id.toString()),
        );
      },
    );
  }
}
