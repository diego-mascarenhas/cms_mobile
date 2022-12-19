class Smtp {
  final int envios;
  final String dominio;

  const Smtp({
    required this.envios,
    required this.dominio,
  });

  factory Smtp.fromJson(Map<String, dynamic> json) {
    return Smtp(
      envios: int.parse(json['envios']),
      dominio: json['dominio'] as String,
    );
  }
}
