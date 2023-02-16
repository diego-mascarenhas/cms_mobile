import 'package:flutter/material.dart';
import 'package:cms_mobile/models/trade_signal_model.dart';
import 'package:cms_mobile/data/trade_signal.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class TradeSignalsPage extends StatelessWidget {
  const TradeSignalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Trade Signals'),
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
            title: Text(
              item[index].triger,
              style: TextStyle(
                  color:
                      (item[index].side == 'sell') ? Colors.red : Colors.green,
                  fontSize: 18 * MediaQuery.textScaleFactorOf(context),
                  height: 1.2),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${item[index].signal} ${item[index].timeFrame}\'',
                  style: TextStyle(
                      fontSize: 16 * MediaQuery.textScaleFactorOf(context),
                      height: 1.2),
                ),
                Text(
                  '${item[index].symbol} - ${DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.parse(item[index].fechaAlta).toLocal())} hs',
                  style: TextStyle(
                      fontSize: 12 * MediaQuery.textScaleFactorOf(context),
                      height: 1.5),
                ),
              ],
            ),
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  'https://finandy.com/coins/32@2x/${item[index].symbol.replaceAll(RegExp('USDT|USDTPERP|PERP'), '').toUpperCase()}x32@2x.png'),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (item[index].volBreak)
                  const Icon(Icons.trending_up, color: Colors.green),
                if (item[index].highVolatility)
                  const Icon(Icons.whatshot, color: Colors.red),
              ],
            ));
      },
    );
  }
}
