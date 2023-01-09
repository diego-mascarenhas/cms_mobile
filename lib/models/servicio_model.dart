class Servicio {
  final int id;
  final String descripcion;
  final String total;
  final String descuento;
  final int estado;

  const Servicio({
    required this.id,
    required this.descripcion,
    required this.total,
    required this.descuento,
    required this.estado,
  });

  factory Servicio.fromJson(Map<String, dynamic> json) {
    return Servicio(
      id: int.parse(json['id']),
      descripcion: json['descripcion'] as String,
      total: json['total'] as String,
      descuento: json['descuento'] as String,
      estado: int.parse(json['id_estado']),
    );
  }
}
