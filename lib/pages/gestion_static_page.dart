import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

enum LegendShape { circle, rectangle }

class GestionPage extends StatefulWidget {
  const GestionPage({Key? key}) : super(key: key);

  @override
  GestionStaticPageState createState() => GestionStaticPageState();
}

class GestionStaticPageState extends State<GestionPage> {
  final dataMap = <String, double>{
    "Desarrollos": 2597013.51,
    "Emailer": 958740.15,
    "Hosting": 10892726.70,
    "Streaming": 1018194.10,
  };

  final legendLabels = <String, String>{
    "Desarrollos": "Desarrollos Web",
    "Emailer": "Email Marketing",
    "Hosting": "Web Hosting",
    "Streaming": "Streaming",
  };

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];

  final gradientList = <List<Color>>[
    [
      const Color.fromRGBO(223, 250, 92, 1),
      const Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      const Color.fromRGBO(129, 182, 205, 1),
      const Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      const Color.fromRGBO(175, 63, 62, 1.0),
      const Color.fromRGBO(254, 154, 92, 1),
    ]
  ];
  final ChartType _chartType = ChartType.disc;
  final double _ringStrokeWidth = 32;
  final double _chartLegendSpacing = 32;

  final bool _showLegendsInRow = false;
  final bool _showLegends = true;
  final bool _showLegendLabel = true;

  final bool _showChartValueBackground = true;
  final bool _showChartValues = true;
  final bool _showChartValuesInPercentage = false;
  final bool _showChartValuesOutside = false;

  final LegendShape _legendShape = LegendShape.circle;
  final LegendPosition _legendPosition = LegendPosition.right;

  int key = 0;

  @override
  Widget build(BuildContext context) {
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: _chartLegendSpacing,
      chartRadius: math.min(MediaQuery.of(context).size.width / 2.2, 300),
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: _chartType,
      centerText: null,
      legendLabels: _showLegendLabel ? legendLabels : {},
      legendOptions: LegendOptions(
        showLegendsInRow: _showLegendsInRow,
        legendPosition: _legendPosition,
        showLegends: _showLegends,
        legendShape: _legendShape == LegendShape.circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        legendTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: _showChartValueBackground,
        showChartValues: _showChartValues,
        showChartValuesInPercentage: _showChartValuesInPercentage,
        showChartValuesOutside: _showChartValuesOutside,
      ),
      ringStrokeWidth: _ringStrokeWidth,
      emptyColor: Colors.grey,
      gradientList: null,
      emptyColorGradient: const [
        Color(0xff6c5ce7),
        Colors.blue,
      ],
      baseChartColor: Colors.transparent,
    );
    final settings = SingleChildScrollView(
      child: Card(
        margin: const EdgeInsets.all(12),
        child: Column(
          children: [],
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestión"),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          if (constraints.maxWidth >= 600) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: chart,
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: settings,
                )
              ],
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 32,
                    ),
                    child: chart,
                  ),
                  settings,
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
