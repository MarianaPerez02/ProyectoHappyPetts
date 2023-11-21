// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectomovil/domain/models/paciente.dart';

class PacienteServices {

Future<void> enviarDatosAFirebase(Paciente paciente) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pacientes = firestore.collection('pacientes');

    Map<String, dynamic> datosParaFirebase = paciente.toJson();

    await pacientes.add(datosParaFirebase);
    print("Datos enviados correctamente a Firebase");
  } catch (error) {
    print("Error al enviar datos a Firebase: $error");
  }
}

}
