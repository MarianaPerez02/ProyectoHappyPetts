import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomovil/ui/screens/app.dart';
import 'package:proyectomovil/domain/controllers/gestionUser/controlleruser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(ControlUserAuth());
  runApp(const MyApp());
}
