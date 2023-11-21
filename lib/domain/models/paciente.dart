class Paciente {
  String id;
  String nombre;
  String especie;
  String edad;
  String sexo;
  String peso;
  String fechaIngreso;
  String nPropietario;
  String aPropietario;
  String identPropietario;
  String direccionPropietario;
  String telefonoPropietario;
  String emailPropietario;
  String sintomas;
  String examenFisico;
  String medicamentos;
  String dosificacion;
  String viaAdmin;
  String descProcedimiento;
  String evolucion;
  String diagnostico;
  String medicamentoRecomendado;
  String cuidados;
  String fechasalida;
  String fechaseguimiento;
  String imagenUrl;

  Paciente({
    required this.id,
    required this.nombre,
    required this.especie,
    required this.edad,
    required this.sexo,
    required this.peso,
    required this.fechaIngreso,
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
    required this.medicamentoRecomendado,
    required this.cuidados,
    required this.fechasalida,
    required this.fechaseguimiento,
    required this.imagenUrl
  });

  factory Paciente.desdeDoc(String id, Map<String, dynamic> json) {
    return Paciente(
      id: id,
      nombre: json["nombre"] ?? '',
      especie: json["especie"] ?? '',
      edad: json["edad"] ?? '',
      sexo: json["sexo"] ?? '',
      peso: json["peso"] ?? '',
      fechaIngreso: json["fechaIngreso"] ?? '',
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
      medicamentoRecomendado: json["medicamentoRecomendado"] ?? '',
      cuidados: json["cuidados"] ?? '',
      fechasalida: json["fechasalida"] ?? '',
      fechaseguimiento: json["fechaseguimiento"] ?? '',
      imagenUrl: json["imagen"]
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
      "fechaIngreso": fechaIngreso,
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
      "medicamento": medicamentoRecomendado,
      "cuidados": cuidados,
      "fechasalida": fechasalida,
      "fechaseguimiento": fechaseguimiento,
      "imagen": imagenUrl
    };
  }
}
