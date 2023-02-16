class TradeSignal {
  final int id;
  final String signal;
  final String triger;
  final String symbol;
  final String side;
  final int timeFrame;
  final bool highVolatility;
  final bool volBreak;
  final String fechaAlta;

  const TradeSignal({
    required this.id,
    required this.signal,
    required this.triger,
    required this.symbol,
    required this.side,
    required this.timeFrame,
    required this.highVolatility,
    required this.volBreak,
    required this.fechaAlta,
  });

  factory TradeSignal.fromJson(Map<String, dynamic> json) {
    return TradeSignal(
      id: int.parse(json['id']),
      signal: json['signal'] as String,
      triger: json['triger'] as String,
      symbol: json['symbol'] as String,
      side: json['side'] as String,
      timeFrame: int.parse(json['time_frame']),
      highVolatility: json['high_volatility'] == "1",
      volBreak: json['vol_break'] == "1",
      fechaAlta: json['fecha_alta'] as String,
    );
  }
}
