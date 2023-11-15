import 'package:flutter/material.dart';
import 'package:proyectomovil/ui/screens/gestionPacientes/ingreasarPacientes/ingresarDatosPropietario.dart';

class IngresarPaciente extends StatefulWidget {
  @override
  _IngresarPacienteState createState() => _IngresarPacienteState();
}

class _IngresarPacienteState extends State<IngresarPaciente> {
  final TextEditingController nombrePacienteController =TextEditingController();
  final TextEditingController especieController = TextEditingController();
  final TextEditingController razaController = TextEditingController();
  final TextEditingController edadController = TextEditingController();
  final TextEditingController sexoController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController fechaIngresoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/image/6.png',
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
                    'Ingresar Paciente',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Datos del Paciente',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: nombrePacienteController,
                    decoration: InputDecoration(
                      labelText: 'Nombre del Paciente',
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
                    controller: especieController,
                    decoration: InputDecoration(
                      labelText:
                          'Especie (Perro, Gato, Conejo, Vaca o Tortuga)',
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
                    controller: razaController,
                    decoration: InputDecoration(
                      labelText: 'Raza',
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
                    controller: edadController,
                    decoration: InputDecoration(
                      labelText: 'Edad',
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
                    controller: sexoController,
                    decoration: InputDecoration(
                      labelText: 'Sexo',
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
                    controller: pesoController,
                    decoration: InputDecoration(
                      labelText: 'Peso en kg',
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
                    controller: fechaIngresoController,
                    decoration: InputDecoration(
                      labelText: 'Fecha de Ingreso (dd/mm/yyyy)',
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
                      final nombrePaciente = nombrePacienteController.text;
                      final especie = especieController.text;
                      final raza = razaController.text;
                      final edad = edadController.text;
                      final sexo = sexoController.text;
                      final peso = pesoController.text;
                      final fechaIngreso = fechaIngresoController.text;

                      print('Nombre del Paciente: $nombrePaciente');
                      print('Especie: $especie');
                      print('Raza: $raza');
                      print('Edad: $edad');
                      print('Sexo: $sexo');
                      print('Peso: $peso');
                      print('Fecha de Ingreso: $fechaIngreso');

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IngresarDatosPropietario()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 20), // Ajusta el tamaño del botón
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)), // Hace que los bordes del botón sean redondeados
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
