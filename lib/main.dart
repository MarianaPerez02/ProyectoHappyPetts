import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomovil/app.dart';
import 'package:proyectomovil/domain/controllers/gestionUser/controllerInventario.dart';
import 'package:proyectomovil/domain/controllers/gestionUser/controllerUser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(ConsultasInventarioController());
  Get.put(ControlUserAuth());
  runApp(const MyApp());
}
