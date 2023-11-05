
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomovil/ui/screens/home/panel_De_Control.dart';
import 'package:proyectomovil/ui/screens/home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const Home(),
      routes: {
        '/pacientes':(context) => const PanelDeControl(),
        
      },
    );
  }
}