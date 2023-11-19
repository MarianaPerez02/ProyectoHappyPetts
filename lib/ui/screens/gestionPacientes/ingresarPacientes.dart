import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyectomovil/ui/screens/gestionPacientes/ingresarDatosPropietario.dart';


class ExpandingTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool enabled;
  final TextInputType keyboardType;

  ExpandingTextField({
    required this.controller,
    required this.labelText,
    this.enabled = true,
    this.keyboardType = TextInputType.multiline,
  });

  @override
  _ExpandingTextFieldState createState() => _ExpandingTextFieldState();
}

class _ExpandingTextFieldState extends State<ExpandingTextField> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 200.0, // Establece la altura máxima del cuadro de texto
      ),
      child: SingleChildScrollView(
        child: TextField(
          controller: widget.controller,
          maxLines: null, // Permite que el cuadro de texto tenga varias líneas
          enabled: widget.enabled,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.keyboardType == TextInputType.number
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ] // Acepta solo dígitos para keyboardType numérico
              : null,
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: const TextStyle(color: Colors.white),
            filled: true,
            fillColor: Colors.grey.shade400,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}

class IngresarPaciente extends StatefulWidget {
  @override
  _IngresarPacienteState createState() => _IngresarPacienteState();
}

class _IngresarPacienteState extends State<IngresarPaciente> {
  final TextEditingController nombrePacienteController = TextEditingController();
  final TextEditingController edadController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController fechaIngresoController = TextEditingController();
  String especieValue = 'Perro';
  String sexoValue = 'Macho';

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
                  ExpandingTextField(
                    controller: nombrePacienteController,
                    labelText: 'Nombre del Paciente',
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: especieValue,
                    onChanged: (newValue) {
                      setState(() {
                        especieValue = newValue!;
                      });
                    },
                    items: <String>['Perro', 'Gato', 'Conejo', 'Tortuga', 'Loro', 'Lagarto', 'Serpiente', 'Camaleon', 'Vaca', 'Leon']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Especie',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ExpandingTextField(
                    controller: edadController,
                    keyboardType: TextInputType.number,
                    labelText: 'Edad',
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: sexoValue,
                    onChanged: (newValue) {
                      setState(() {
                        sexoValue = newValue!;
                      });
                    },
                    items: <String>['Macho', 'Hembra']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
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
                  ExpandingTextField(
                    controller: pesoController,
                    keyboardType: TextInputType.number,
                    labelText: 'Peso en kg',
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );

                      if (pickedDate != null && pickedDate != DateTime.now()) {
                        setState(() {
                          fechaIngresoController.text =
                              pickedDate.toLocal().toString().split(' ')[0];
                        });
                      }
                    },
                    child: ExpandingTextField(
                      enabled: false,
                      controller: fechaIngresoController,
                      labelText: 'Fecha de Ingreso (dd/mm/yyyy)',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final nombrePaciente = nombrePacienteController.text;
                      final edad = edadController.text;
                      final peso = pesoController.text;
                      final fechaIngreso = fechaIngresoController.text;

                      print('Nombre del Paciente: $nombrePaciente');
                      print('Especie: $especieValue');
                      print('Edad: $edad');
                      print('Sexo: $sexoValue');
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
                          horizontal: 60, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
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