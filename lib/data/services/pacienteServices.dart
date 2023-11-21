// ignore: file_names
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
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

  Future<String?> uploadServicioCover(
      String imagePath, String newServicioId) async {
    try {
      File image = File(imagePath);
      final ext = image.path.split('.').last.toLowerCase();
      if (ext == 'png' || ext == 'jpg') {
        var uploadTask = await FirebaseStorage.instance
            .ref('pacientes/$newServicioId.$ext')
            .putFile(image);
        debugPrint('Subida completada');
        var downloadUrl = await uploadTask.ref.getDownloadURL();
        return downloadUrl;
      } else {
        debugPrint(
            'Formato de imagen no válido. Solo se permiten archivos .png o .jpg.');
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<void> updateCoverPaciente(String newServicio, String imageUrl) async {
    var reference =
        FirebaseFirestore.instance.collection("servicios").doc(newServicio);
    return reference.update({
      'imagenes': imageUrl,
    });
  }
}
