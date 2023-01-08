class Ticket {
  final int id;
  final String asunto;
  final String area;
  final String prioridad;
  final int estado;

  const Ticket({
    required this.id,
    required this.asunto,
    required this.area,
    required this.prioridad,
    required this.estado,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: int.parse(json['id']),
      asunto: json['asunto'] as String,
      area: json['id_area'] as String,
      prioridad: json['prioridad'] as String,
      estado: int.parse(json['estado']),
    );
  }
}
