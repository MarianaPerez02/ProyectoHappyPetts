import 'package:flutter/material.dart';
import 'package:proyectomovil/ui/screens/gestionInventario/Inventario/consultarInventario.dart';
import 'package:get/get.dart';
import 'package:proyectomovil/ui/screens/gestionInventario/ingresarMedicamento/ingresarMedicamentos.dart';
import 'package:proyectomovil/ui/screens/gestionPacientes/epicrisisClinica/consultarEpicrisis.dart';
import 'package:proyectomovil/ui/screens/gestionPacientes/ingreasarPacientes/ingresarPacientes.dart';
import 'package:proyectomovil/ui/screens/gestionUser/login.dart';
import 'package:proyectomovil/ui/screens/panelDeControl/witgeth/MyBody.dart';
import 'package:proyectomovil/ui/screens/panelDeControl/witgeth/MyDrawer.dart';


// Asegúrate de importar el archivo correctamente

class PanelDeControl extends StatelessWidget {
  const PanelDeControl({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/image/6.png', // Asegúrate de reemplazar 'assets/imagen3.png' con la ruta de tu imagen.
              fit: BoxFit.contain,
              height: 60,
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white, // Cambiar el color de fondo a blanco
        iconTheme: const IconThemeData(
            color: Color.fromARGB(
                255, 10, 7, 7)), // Cambiar el color del icono de la barra
      ),
      drawer: const MyDrawer(),
      body: const mybody(),
    );
  }
}

