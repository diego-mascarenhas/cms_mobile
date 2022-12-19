class Contacto {
  final int id;
  final String nombre;
  final String apellido;
  final String email;
  final int estado;

  const Contacto({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.estado,
  });

  factory Contacto.fromJson(Map<String, dynamic> json) {
    return Contacto(
      id: int.parse(json['id']),
      nombre: json['nombre'] as String,
      apellido: json['apellido'] as String,
      email: json['email'] as String,
      estado: int.parse(json['estado']),
    );
  }
}
