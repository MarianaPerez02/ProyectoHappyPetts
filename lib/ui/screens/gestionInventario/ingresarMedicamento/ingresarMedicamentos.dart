import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectomovil/data/services/inventario_services.dart';
import 'package:proyectomovil/ui/screens/panelDeControl/panel_De_Control.dart';

class IngresarMedicamento extends StatefulWidget {
  const IngresarMedicamento({super.key});

  @override
  State<IngresarMedicamento> createState() => IngresarMedicamentoState();
}

class IngresarMedicamentoState extends State<IngresarMedicamento> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController cantidadController = TextEditingController();
  final TextEditingController loteController = TextEditingController();
  final TextEditingController fechaFabricacionController =
      TextEditingController();
  final TextEditingController fechaCaducidadController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.black), // Cambiar el color de la flecha de retroceso
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/image/6.png', // Asegúrate de reemplazar 'assets/imagen3.png' con la ruta de tu imagen.
          fit: BoxFit.contain,
          height: 100,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    height: 2,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Ingresar Medicamento',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Datos del Medicamento',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30.0),
                  TextField(
                    controller: nombreController,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: cantidadController,
                    decoration: InputDecoration(
                      labelText: 'Cantidad del Medicamento',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: loteController,
                    decoration: InputDecoration(
                      labelText: 'Lote del Medicamento',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: fechaFabricacionController,
                    decoration: InputDecoration(
                      labelText: 'Fecha de Fabricación (dd/mm/yyyy)',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: fechaCaducidadController,
                    decoration: InputDecoration(
                      labelText: 'Fecha de Caducidad (dd/mm/yyyy)',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      saveInventario(context);
                      nombreController.clear();
                      cantidadController.clear();
                      loteController.clear();
                      fechaFabricacionController.clear();
                      fechaCaducidadController.clear();

                      // final nombre = nombreController.text;
                      // final cantidad = cantidadController.text;
                      // final lote = loteController.text;
                      // final fechaFabricacion = fechaFabricacionController.text;
                      // final fechaCaducidad = fechaCaducidadController.text;

                      // print('Nombre: $nombre');
                      // print('Cantidad: $cantidad');
                      // print('Lote: $lote');
                      // print('Fecha de Fabricación: $fechaFabricacion');
                      // print('Fecha de Caducidad: $fechaCaducidad');

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PanelDeControl(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 20), // Ajusta el tamaño del botón
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              30)), // Hace que los bordes del botón sean redondeados
                    ),
                    child:
                        const Text('Guardar', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveInventario(BuildContext context) async {
    var nombre = nombreController.text;
    var cantidad = cantidadController.text;
    var lote = loteController.text;
    var fechaFabricacion = fechaFabricacionController.text;
    var fechaCaducidad = fechaCaducidadController.text;

    await InventarioServices()
        .saveServicio(nombre, cantidad, lote, fechaFabricacion, fechaCaducidad);
  }

  Future<void> guardarDatosAdicionalesEnFirestore(
      User user, Map<String, dynamic> datos) async {
    CollectionReference usuariosCollection =
        FirebaseFirestore.instance.collection('inventario');
    await usuariosCollection.doc(user.uid).set(datos);
  }
}
