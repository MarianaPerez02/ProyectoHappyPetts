import 'package:flutter/material.dart';
import 'package:proyectomovil/ui/screens/gestionInventario/IngresarCuadroClinicoParte1.dart';


class IngresarDatosPropietario extends StatefulWidget {
  const IngresarDatosPropietario({super.key});

  @override
  State<IngresarDatosPropietario> createState() => IngresarDatosPropietarioState();
}

class IngresarDatosPropietarioState extends State<IngresarDatosPropietario> {

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController identificacionController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();


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
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Container(
                    color: Colors.red,
                    height: 2,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Ingresar Paciente',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Datos del Propietario',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 16),
                  TextField(
                    controller: apellidoController,
                    decoration: InputDecoration(
                      labelText: 'Apellido',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: identificacionController,
                    decoration: InputDecoration(
                      labelText: 'Identificación',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: direccionController,
                    decoration: InputDecoration(
                      labelText: 'Dirección',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: telefonoController,
                    decoration: InputDecoration(
                      labelText: 'Teléfono',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final nombre = nombreController.text;
                      final apellido = apellidoController.text;
                      final identificacion = identificacionController.text;
                      final direccion = direccionController.text;
                      final telefono = telefonoController.text;
                      final email = emailController.text;

                      print('Nombre: $nombre');
                      print('Apellido: $apellido');
                      print('Identificación: $identificacion');
                      print('Dirección: $direccion');
                      print('Teléfono: $telefono');
                      print('Email: $email');

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const IngresarDatosCuadroClinicoParte1()),
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
                    child: const Text('Continuar', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

