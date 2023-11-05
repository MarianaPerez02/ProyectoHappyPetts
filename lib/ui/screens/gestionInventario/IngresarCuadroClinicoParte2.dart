import 'package:flutter/material.dart';
import 'package:proyectomovil/ui/screens/screens.dart';


class IngresarDatosCuadroClinicoParte2 extends StatefulWidget {
  const IngresarDatosCuadroClinicoParte2({super.key});

  @override
  State<IngresarDatosCuadroClinicoParte2> createState() => IngresarDatosCuadroClinicoParte2State();
}

class IngresarDatosCuadroClinicoParte2State extends State<IngresarDatosCuadroClinicoParte2> {

  final TextEditingController evolucionController = TextEditingController();
  final TextEditingController diagnosticoFinalController = TextEditingController();
  final TextEditingController medicamentosRecomendadosController = TextEditingController();
  final TextEditingController cuidadosController = TextEditingController();
  final TextEditingController fechaSalidaController = TextEditingController();
  final TextEditingController fechaSeguimientoController = TextEditingController();
  final TextEditingController firmaVeterinarioController = TextEditingController();

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
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    'Cuadro Clínico',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: evolucionController,
                    decoration: InputDecoration(
                      labelText: 'Evolución',
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
                    controller: diagnosticoFinalController,
                    decoration: InputDecoration(
                      labelText: 'Diagnóstico Final',
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
                    controller: medicamentosRecomendadosController,
                    decoration: InputDecoration(
                      labelText: 'Medicamentos Recomendados',
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
                    controller: cuidadosController,
                    decoration: InputDecoration(
                      labelText: 'Cuidados',
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
                    controller: fechaSalidaController,
                    decoration: InputDecoration(
                      labelText: 'Fecha de Salida',
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
                    controller: fechaSeguimientoController,
                    decoration: InputDecoration(
                      labelText: 'Fecha de Seguimiento',
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
                    controller: firmaVeterinarioController,
                    decoration: InputDecoration(
                      labelText: 'Firma de Veterinario',
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
                      final evolucion = evolucionController.text;
                      final diagnosticoFinal = diagnosticoFinalController.text;
                      final medicamentosRecomendados =
                          medicamentosRecomendadosController.text;
                      final cuidados = cuidadosController.text;
                      final fechaSalida = fechaSalidaController.text;
                      final fechaSeguimiento = fechaSeguimientoController.text;
                      final firmaVeterinario = firmaVeterinarioController.text;

                      print('Evolución: $evolucion');
                      print('Diagnóstico Final: $diagnosticoFinal');
                      print(
                          'Medicamentos Recomendados: $medicamentosRecomendados');
                      print('Cuidados: $cuidados');
                      print('Fecha de Salida: $fechaSalida');
                      print('Fecha de Seguimiento: $fechaSeguimiento');
                      print('Firma de Veterinario: $firmaVeterinario');

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
                          horizontal: 70,
                          vertical: 20), // Ajusta el tamaño del botón
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              30)), // Hace que los bordes del botón sean redondeados
                    ),
                    child: const Text('Guardar', style: TextStyle(fontSize: 20)),
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


