import 'package:flutter/material.dart';
import 'epicrisis.dart';

class EditarEpicrisis extends StatelessWidget {
  final Epicrisis epicrisis;

  EditarEpicrisis({required this.epicrisis});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          height: 100,
          color: Colors.white,
          child: Center(
            child: Image.asset(
              'assets/image/33.png',
              fit: BoxFit.cover,
              height: 80,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Editar Epicrisis'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Epicrisis Clínica',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text('Datos del paciente:'),
              Text('Nombre del paciente: ${epicrisis.nombrePaciente}'),
              Text('Especie: ${epicrisis.especie}'),
              Text('Sexo: ${epicrisis.sexo}'),
              Text('Peso: ${epicrisis.peso} kg'),
              Text('Fecha de Ingreso: ${epicrisis.fechaIngreso}'),
              const SizedBox(height: 16),
              const Text('Datos del propietario:'),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Nombre del propietario',
                ),
                controller: TextEditingController(text: epicrisis.nombrePropietario),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Apellidos',
                ),
                controller: TextEditingController(text: epicrisis.apellidosPropietario),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Identificación',
                ),
                controller: TextEditingController(text: epicrisis.identificacionPropietario),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Dirección',
                ),
                controller: TextEditingController(text: epicrisis.direccionPropietario),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Aquí puedes implementar la lógica para guardar los cambios
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}