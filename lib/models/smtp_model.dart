class Smtp {
  final int id;
  final String host;
  final String user;
  final int mailq;
  final int estado;

  const Smtp({
    required this.id,
    required this.host,
    required this.user,
    required this.mailq,
    required this.estado,
  });

  factory Smtp.fromJson(Map<String, dynamic> json) {
    return Smtp(
      id: int.parse(json['id']),
      host: json['host'] as String,
      user: json['user'] as String,
      mailq: int.parse(json['mailq']),
      estado: int.parse(json['estado']),
    );
  }
}
