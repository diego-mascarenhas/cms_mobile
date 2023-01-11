import 'package:flutter/material.dart';
import 'package:cms_mobile/models/trade_signal_model.dart';
import 'package:cms_mobile/data/trade_signal.dart';

import 'package:http/http.dart' as http;

class TradeSignalsPage extends StatelessWidget {
  const TradeSignalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Signals'),
        ),
        body: FutureBuilder<List<TradeSignal>>(
          future: fetchItems(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              return TradeSignalsList(item: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFed5565)),
              );
            }
          },
        ),
      );
}

class TradeSignalsList extends StatelessWidget {
  const TradeSignalsList({super.key, required this.item});

  final List<TradeSignal> item;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: item.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.all(15),
          title: Text(item[index].signal,
              style: TextStyle(
                  color: (item[index].side == 'sell')
                      ? Colors.red
                      : Colors.green)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item[index].triger), //${item[index].symbol}:
              Text('${item[index].fecha_alta} UTC'),
            ],
          ),
          //textColor: (item[index].side == 'sell') ? Colors.red : Colors.green,
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                'http://api.revisionalpha.es/app-assets/icons/${item[index].symbol.replaceAll('USDT', '').toLowerCase()}.png'),
            // https://finandy.com/coins/32@2x/OCEANx32@2x.png

            //AssetImage('assets/icons/${item[index].symbol.replaceAll('USDT', '')}2x.png'),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        );
      },
    );
  }
}
