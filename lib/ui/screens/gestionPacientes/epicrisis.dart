class Epicrisis {
  String nombrePaciente;
  String especie;
  String sexo;
  double peso;
  String fechaIngreso;
  String nombrePropietario;
  String apellidosPropietario;
  String identificacionPropietario;
  String direccionPropietario;

  Epicrisis({
    this.nombrePaciente = '',
    this.especie = '',
    this.sexo = '',
    this.peso = 0.0,
    this.fechaIngreso = '',
    required this.nombrePropietario,
    required this.apellidosPropietario,
    required this.identificacionPropietario,
    required this.direccionPropietario,
  });
}