import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:proyectomovil/domain/models/inventario.dart';

class InventarioServices {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  final servRef = FirebaseFirestore.instance
      .collection('inventario')
      .withConverter(
          fromFirestore: (snapshop, _) =>
              Inventario.desdeDoc(snapshop.id, snapshop.data()!),
          toFirestore: (serv, _) => serv.toJson());

  static Future<String> editInventario(
      String nombre,
      String cantidad,
      String lote,
      String tipo,
      String fechaFabricacion,
      String fechaCaducidad,
      String descripcion,
      String dosificicacion,
      String frecuencia,
      String viaAdministracion) async {
    var reference = FirebaseFirestore.instance.collection("inventario");
    var result = await reference.add({
      'nombre': nombre,
      'cantidad': cantidad,
      'lote': lote,
      'fechaFabricacion': fechaFabricacion,
      'fechaCaducidad': fechaCaducidad,
      'descripcion': descripcion,
      'dosificicacion': dosificicacion,
      'frecuencia': frecuencia,
      'viaAdministracion': viaAdministracion
    });
    return Future.value(result.id);
  }

  Future<String> saveServicio(String nombre, String cantidad, String lote,
      String fechaFabricacion, String fechaCaducidad) async {
    var reference = FirebaseFirestore.instance.collection("inventario");
    var result = await reference.add({
      'nombre': nombre,
      'cantidad': cantidad,
      'lote': lote,
      'fechaFabricacion': fechaFabricacion,
      'fechaCaducidad': fechaCaducidad
    });
    return Future.value(result.id);
  }

  Future<String?> uploadServicioCover(
      String imagePath, String newServicioId) async {
    try {
      File image = File(imagePath);
      final ext = image.path.split('.').last.toLowerCase();
      if (ext == 'png' || ext == 'jpg') {
        var uploadTask = await FirebaseStorage.instance
            .ref('users/$newServicioId.$ext')
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

  Future<void> updateCoverMedicamento(
      String newServicio, String imageUrl) async {
    var reference =
        FirebaseFirestore.instance.collection("inventario").doc(newServicio);
    return reference.update({
      'imagenes': imageUrl,
    });
  }

  Future<void> updateMedicamento(String newServicio, String descripcion,
      String dosificacion, String frecuencia, String viaAdmi) async {
    var reference =
        FirebaseFirestore.instance.collection("inventario").doc(newServicio);
    return reference.update({
      'descripcion': descripcion,
      'dosificacion': dosificacion,
      'frecuencia': frecuencia,
      'viaAdministracion': viaAdmi,
    });
  }

  static Future<List<Inventario>> listarInventario() async {
    QuerySnapshot querySnapshot = await _db.collection("inventario").get();
    List<Inventario> lista = [];
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      lista.add(Inventario.desdeDoc(doc.id, data));
    }
    return lista;
  }

  static Future<void> actualizarInventario(
      String userId, Map<String, dynamic> datos) async {
    try {
      await _db.collection('inventario').doc(userId).update(datos);
      print('Medicamento actualizado correctamente.');
    } catch (error) {
      print('Error al actualizar medicamento: $error');
    }
  }

  static Future<void> eliminarInventario(String id) async {
    await _db.collection('inventario').doc(id).delete().catchError((e) {});
  }
}
