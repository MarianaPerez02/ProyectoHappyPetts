import 'package:flutter/material.dart';
import 'package:proyectomovil/domain/models/paciente.dart';
import 'package:proyectomovil/ui/screens/gestionPacientes/ingreasarPacientes/IngresarCuadroClinicoParte2.dart';

class IngresarDatosCuadroClinicoParte1 extends StatefulWidget {
  final Paciente paciente;
  const IngresarDatosCuadroClinicoParte1({super.key, required this.paciente});

  @override
  State<IngresarDatosCuadroClinicoParte1> createState() => IngresarDatosCuadroClinicoParte1State();
}

class IngresarDatosCuadroClinicoParte1State extends State<IngresarDatosCuadroClinicoParte1> {
  
  final TextEditingController sintomasController = TextEditingController();
  final TextEditingController examenFisicoController = TextEditingController();
  final TextEditingController medicamentosController = TextEditingController();
  final TextEditingController dosificacionController = TextEditingController();
  final TextEditingController viaAdministracionController = TextEditingController();
  final TextEditingController descripcionProcedimientoController = TextEditingController();
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
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Cuadro Clínico',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: sintomasController,
                        decoration: InputDecoration(
                          labelText: 'Síntomas',
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
                        controller: examenFisicoController,
                        decoration: InputDecoration(
                          labelText: 'Examen Físico',
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
                        controller: medicamentosController,
                        decoration: InputDecoration(
                          labelText: 'Medicamentos',
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
                        controller: dosificacionController,
                        decoration: InputDecoration(
                          labelText: 'Dosificación',
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
                        controller: viaAdministracionController,
                        decoration: InputDecoration(
                          labelText: 'Vía de Administración',
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
                        controller: descripcionProcedimientoController,
                        decoration: InputDecoration(
                          labelText: 'Descripción del Procedimiento',
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
                          final sintomas = sintomasController.text;
                          final examenFisico = examenFisicoController.text;
                          final medicamentos = medicamentosController.text;
                          final dosificacion = dosificacionController.text;
                          final viaAdministracion = viaAdministracionController.text;
                          final descripcionProcedimiento = descripcionProcedimientoController.text;

                          print('Síntomas: $sintomas');
                          print('Examen Físico: $examenFisico');
                          print('Medicamentos: $medicamentos');
                          print('Dosificación: $dosificacion');
                          print('Vía de Administración: $viaAdministracion');
                          print('Descripción del Procedimiento: $descripcionProcedimiento');

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  IngresarDatosCuadroClinicoParte2(paciente: widget.paciente,)),
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
                            const Text('Continuar', style: TextStyle(fontSize: 20)),
                      ),
                    ])),
          ],
        ),
      ),
    );
  }
}

