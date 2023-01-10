class TradeSignal {
  final int id;
  final String signal;
  final String triger;
  final String symbol;
  final String side;
  final String fecha_alta;

  const TradeSignal({
    required this.id,
    required this.signal,
    required this.triger,
    required this.symbol,
    required this.side,
    required this.fecha_alta,
  });

  factory TradeSignal.fromJson(Map<String, dynamic> json) {
    return TradeSignal(
      id: int.parse(json['id']),
      signal: json['signal'] as String,
      triger: json['triger'] as String,
      symbol: json['symbol'] as String,
      side: json['side'] as String,
      fecha_alta: json['fecha_alta'] as String,
    );
  }
}
