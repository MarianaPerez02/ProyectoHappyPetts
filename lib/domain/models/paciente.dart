class Paciente {
  final String id;
  final String nombre;
  final String especie;
  final String edad;
  final String sexo;
  final String peso;
  final String pesoIngreso;
  final String nPropietario;
  final String aPropietario;
  final String identPropietario;
  final String direccionPropietario;
  final String telefonoPropietario;
  final String emailPropietario;
  final String sintomas;
  final String examenFisico;
  final String medicamentos;
  final String dosificacion;
  final String viaAdmin;
  final String descProcedimiento;
  final String evolucion;
  final String diagnostico;
  final String medicamento;
  final String cuidados;
  final String fechasalida;
  final String fechaseguimiento;

  Paciente({
    required this.id,
    required this.nombre,
    required this.especie,
    required this.edad,
    required this.sexo,
    required this.peso,
    required this.pesoIngreso,
    required this.nPropietario,
    required this.aPropietario,
    required this.identPropietario,
    required this.direccionPropietario,
    required this.telefonoPropietario,
    required this.emailPropietario,
    required this.sintomas,
    required this.examenFisico,
    required this.medicamentos,
    required this.dosificacion,
    required this.viaAdmin,
    required this.descProcedimiento,
    required this.evolucion,
    required this.diagnostico,
    required this.medicamento,
    required this.cuidados,
    required this.fechasalida,
    required this.fechaseguimiento,
  });

  factory Paciente.desdeDoc(String id, Map<String, dynamic> json) {
    return Paciente(
      id: id,
      nombre: json["nombre"] ?? '',
      especie: json["especie"] ?? '',
      edad: json["edad"] ?? '',
      sexo: json["sexo"] ?? '',
      peso: json["peso"] ?? '',
      pesoIngreso: json["pesoIngreso"] ?? '',
      nPropietario: json["nPropietario"] ?? '',
      aPropietario: json["aPropietario"] ?? '',
      identPropietario: json["identPropietario"] ?? '',
      direccionPropietario: json["direccionPropietario"] ?? '',
      telefonoPropietario: json["telefonoPropietario"] ?? '',
      emailPropietario: json["emailPropietario"] ?? '',
      sintomas: json["sintomas"] ?? '',
      examenFisico: json["examenFisico"] ?? '',
      medicamentos: json["medicamentos"] ?? '',
      dosificacion: json["dosificacion"] ?? '',
      viaAdmin: json["viaAdmin"] ?? '',
      descProcedimiento: json["descProcedimiento"] ?? '',
      evolucion: json["evolucion"] ?? '',
      diagnostico: json["diagnostico"] ?? '',
      medicamento: json["medicamento"] ?? '',
      cuidados: json["cuidados"] ?? '',
      fechasalida: json["fechasalida"] ?? '',
      fechaseguimiento: json["fechaseguimiento"] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nombre": nombre,
      "especie": especie,
      "edad": edad,
      "sexo": sexo,
      "peso": peso,
      "pesoIngreso": pesoIngreso,
      "nPropietario": nPropietario,
      "aPropietario": aPropietario,
      "identPropietario": identPropietario,
      "direccionPropietario": direccionPropietario,
      "telefonoPropietario": telefonoPropietario,
      "emailPropietario": emailPropietario,
      "sintomas": sintomas,
      "examenFisico": examenFisico,
      "medicamentos": medicamentos,
      "dosificacion": dosificacion,
      "viaAdmin": viaAdmin,
      "descProcedimiento": descProcedimiento,
      "evolucion": evolucion,
      "diagnostico": diagnostico,
      "medicamento": medicamento,
      "cuidados": cuidados,
      "fechasalida": fechasalida,
      "fechaseguimiento": fechaseguimiento,
    };
  }
}
