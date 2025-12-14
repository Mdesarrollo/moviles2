class Usuario {
  final String nombre;
  final String segundoNombre;
  final String apellido1;
  final String apellido2;
  final String email;
  final String password;
  final String telefono;
  final String documento;
  final String sexo;

  Usuario({
    required this.nombre,
    required this.segundoNombre,
    required this.apellido1,
    required this.apellido2,
    required this.email,
    required this.password,
    required this.telefono,
    required this.documento,
    required this.sexo,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nombre: json["name"] ?? "",
      segundoNombre: json["middle_name"] ?? "",
      apellido1: json["last_name"] ?? "",
      apellido2: json["last_name2"] ?? "",
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      telefono: json["phone_number"] ?? "",
      documento: json["documento"] ?? "",
      sexo: json["sexo"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": nombre,
      "middle_name": segundoNombre,
      "last_name": apellido1,
      "last_name2": apellido2,
      "email": email,
      "password": password,
      "phone_number": telefono,
      "documento": documento,
      "sexo": sexo,
    };
  }
}
