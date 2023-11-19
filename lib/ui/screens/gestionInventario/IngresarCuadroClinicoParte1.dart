import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyectomovil/ui/screens/gestionInventario/IngresarCuadroClinicoParte2.dart';


class IngresarDatosCuadroClinicoParte1 extends StatefulWidget {
  const IngresarDatosCuadroClinicoParte1({Key? key}) : super(key: key);

  @override
  State<IngresarDatosCuadroClinicoParte1> createState() =>
      IngresarDatosCuadroClinicoParte1State();
}

class IngresarDatosCuadroClinicoParte1State
    extends State<IngresarDatosCuadroClinicoParte1> {
  final TextEditingController sintomasController = TextEditingController();
  final TextEditingController examenFisicoController = TextEditingController();
  final TextEditingController medicamentosController = TextEditingController();
  final TextEditingController dosificacionController = TextEditingController();
  final TextEditingController viaAdministracionController =
      TextEditingController();
  final TextEditingController descripcionProcedimientoController =
      TextEditingController();

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
                    'Cuadro Clínico',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ExpandingTextField(
                    controller: sintomasController,
                    labelText: 'Síntomas',
                  ),
                  const SizedBox(height: 16),
                  ExpandingTextField(
                    controller: examenFisicoController,
                    labelText: 'Examen Físico',
                  ),
                  const SizedBox(height: 16),
                  ExpandingTextField(
                    controller: medicamentosController,
                    labelText: 'Medicamentos',
                  ),
                  const SizedBox(height: 16),
                  NumericTextField(
                    controller: dosificacionController,
                    labelText: 'Dosificación',
                  ),
                  const SizedBox(height: 16),
                  DropdownField(
                    controller: viaAdministracionController,
                    labelText: 'Vía de Administración',
                    options: ['Oral', 'Intravenosa', 'Intramuscular', 'Subcutánea', 'Rectal'],
                  ),
                  const SizedBox(height: 16),
                  ExpandingTextField(
                    controller: descripcionProcedimientoController,
                    labelText: 'Descripción del Procedimiento',
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final sintomas = sintomasController.text;
                      final examenFisico = examenFisicoController.text;
                      final medicamentos = medicamentosController.text;
                      final dosificacion = dosificacionController.text;
                      final viaAdministracion = viaAdministracionController.text;
                      final descripcionProcedimiento =
                          descripcionProcedimientoController.text;

                      print('Síntomas: $sintomas');
                      print('Examen Físico: $examenFisico');
                      print('Medicamentos: $medicamentos');
                      print('Dosificación: $dosificacion');
                      print('Vía de Administración: $viaAdministracion');
                      print('Descripción del Procedimiento: $descripcionProcedimiento');

                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const IngresarDatosCuadroClinicoParte2())
                  );
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 20), // Ajusta el tamaño del botón
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30)), // Hace que los bordes del botón sean redondeados
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

class ExpandingTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  ExpandingTextField({
    required this.controller,
    required this.labelText,
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

class NumericTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  NumericTextField({
    required this.controller,
    required this.labelText,
  });

  @override
  _NumericTextFieldState createState() => _NumericTextFieldState();
}

class _NumericTextFieldState extends State<NumericTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ], // Acepta solo dígitos
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.grey.shade400,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class DropdownField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final List<String> options;

  DropdownField({
    required this.controller,
    required this.labelText,
    required this.options,
  });

  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: dropdownValue,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: widget.options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.grey.shade400,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}