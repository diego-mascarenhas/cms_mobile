class Factura {
  final int id;
  final String comprobante;
  final String total;
  final String fecha;
  final int estado;

  const Factura({
    required this.id,
    required this.comprobante,
    required this.total,
    required this.fecha,
    required this.estado,
  });

  factory Factura.fromJson(Map<String, dynamic> json) {
    return Factura(
      id: int.parse(json['id']),
      comprobante: json['comprobante'] as String,
      total: json['total'] as String,
      fecha: json['fecha'] as String,
      estado: int.parse(json['id_estado']),
    );
  }
}
