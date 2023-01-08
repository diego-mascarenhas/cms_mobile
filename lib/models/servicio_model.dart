class Servicio {
  final int id;
  final String operacion;
  final String valor;
  final String descuento;
  final int estado;

  const Servicio({
    required this.id,
    required this.operacion,
    required this.valor,
    required this.descuento,
    required this.estado,
  });

  factory Servicio.fromJson(Map<String, dynamic> json) {
    return Servicio(
      id: int.parse(json['id']),
      operacion: json['operacion'] as String,
      valor: json['valor'] as String,
      descuento: json['descuento'] as String,
      estado: int.parse(json['estado']),
    );
  }
}
