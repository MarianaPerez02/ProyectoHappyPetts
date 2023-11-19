class Inventario {
  final String id;
  final String uid;
  final String nombre;
  final String cantidad;
  final String lote;
  final String fechaFabricacion;
  final String fechaCaducidad;
  final String descripcion;
  final String dosificicacion;
  final String frecuencia;
  final String viaAdministracion;
  final String imagen;

  Inventario(
      {required this.id,
      required this.uid,
      required this.nombre,
      required this.cantidad,
      required this.lote,
      required this.fechaFabricacion,
      required this.fechaCaducidad,
      required this.descripcion,
      required this.dosificicacion,
      required this.frecuencia,
      required this.viaAdministracion,
      required this.imagen});

  factory Inventario.desdeDoc(String id, Map<String, dynamic> json) {
    return Inventario(
        id: id,
        uid: json['uid'] ?? '',
        nombre: json["nombre"] ?? '',
        cantidad: json["cantidad"] ?? '',
        lote: json["lote"] ?? '',
        fechaFabricacion: json["fechaFabricacion"] ?? '',
        fechaCaducidad: json["fechaCaducidad"] ?? '',
        descripcion: json["descripcion"] ?? 'N/A',
        dosificicacion: json["dosificacion"] ?? 'N/A',
        frecuencia: json["frecuencia"] ?? 'N/A',
        viaAdministracion: json["viaAdministracion"] ?? 'N/A',
        imagen: json['imagen'] ?? 'N/A');
  }
  toJson() {
    throw UnimplementedError();
  }
}
