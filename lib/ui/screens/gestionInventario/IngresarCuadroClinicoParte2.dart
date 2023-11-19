import 'package:flutter/material.dart';

class IngresarDatosCuadroClinicoParte2 extends StatefulWidget {
  const IngresarDatosCuadroClinicoParte2({Key? key}) : super(key: key);

  @override
  _IngresarDatosCuadroClinicoParte2State createState() =>
      _IngresarDatosCuadroClinicoParte2State();
}

class _IngresarDatosCuadroClinicoParte2State
    extends State<IngresarDatosCuadroClinicoParte2> {
  final TextEditingController evolucionController = TextEditingController();
  final TextEditingController diagnosticoFinalController =
      TextEditingController();
  final TextEditingController medicamentosRecomendadosController =
      TextEditingController();
  final TextEditingController cuidadosController = TextEditingController();
  final TextEditingController fechaSalidaController = TextEditingController();
  final TextEditingController fechaSeguimientoController =
      TextEditingController();
  final TextEditingController firmaVeterinarioController = TextEditingController();

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

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
                  ExpandingTextField(
                    controller: evolucionController,
                    labelText: 'Evolución',
                  ),
                  const SizedBox(height: 16),
                  ExpandingTextField(
                    controller: diagnosticoFinalController,
                    labelText: 'Diagnóstico Final',
                  ),
                  const SizedBox(height: 16),
                  ExpandingTextField(
                    controller: medicamentosRecomendadosController,
                    labelText: 'Medicamentos Recomendados',
                  ),
                  const SizedBox(height: 16),
                  ExpandingTextField(
                    controller: cuidadosController,
                    labelText: 'Cuidados',
                  ),
                  const SizedBox(height: 16),
                  DatePickerField(
                    controller: fechaSalidaController,
                    labelText: 'Fecha de Salida',
                    onTap: () => _selectDate(context, fechaSalidaController),
                  ),
                  const SizedBox(height: 16),
                  DatePickerField(
                    controller: fechaSeguimientoController,
                    labelText: 'Fecha de Seguimiento',
                    onTap: () =>
                        _selectDate(context, fechaSeguimientoController),
                  ),
                  const SizedBox(height: 16),
                  ExpandingTextField(
                    controller: firmaVeterinarioController,
                    labelText: 'Firma de Veterinario',
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
                      final firmaVeterinario =
                          firmaVeterinarioController.text;

                      print('Evolución: $evolucion');
                      print('Diagnóstico Final: $diagnosticoFinal');
                      print(
                          'Medicamentos Recomendados: $medicamentosRecomendados');
                      print('Cuidados: $cuidados');
                      print('Fecha de Salida: $fechaSalida');
                      print('Fecha de Seguimiento: $fechaSeguimiento');
                      print('Firma de Veterinario: $firmaVeterinario');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 70,
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
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
    return TextField(
      controller: widget.controller,
      maxLines: null,
      keyboardType: TextInputType.multiline,
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

class DatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final VoidCallback onTap;

  DatePickerField({
    required this.controller,
    required this.labelText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: onTap,
      readOnly: true,
      decoration: InputDecoration(
        labelText: labelText,
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