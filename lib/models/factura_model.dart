class Factura {
  final int id;
  final String operacion;
  final String numero;
  final String fecha;
  final int estado;

  const Factura({
    required this.id,
    required this.operacion,
    required this.numero,
    required this.fecha,
    required this.estado,
  });

  factory Factura.fromJson(Map<String, dynamic> json) {
    return Factura(
      id: int.parse(json['id']),
      operacion: json['operacion'] as String,
      numero: json['numero_factura'] as String,
      fecha: json['fecha'] as String,
      estado: int.parse(json['estado']),
    );
  }
}
