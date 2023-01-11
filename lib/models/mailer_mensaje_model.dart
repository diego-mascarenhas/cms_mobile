class Mensajes {
  final int id;
  final String asunto;
  final String lista;
  final String template;
  final int estado;

  const Mensajes({
    required this.id,
    required this.asunto,
    required this.lista,
    required this.template,
    required this.estado,
  });

  factory Mensajes.fromJson(Map<String, dynamic> json) {
    return Mensajes(
      id: int.parse(json['id']),
      asunto: json['asunto'] as String,
      lista: json['prioridad'] as String,
      template: json['id_template'] as String,
      estado: int.parse(json['estado']),
    );
  }
}
