import 'package:flutter/material.dart';

class Medicamento {
  final String nombre;
  final String cantidad;
  final String lote;
  final String fechaFabricacion;
  final String fechaCaducidad;

  Medicamento({
    required this.nombre,
    required this.cantidad,
    required this.lote,
    required this.fechaFabricacion,
    required this.fechaCaducidad,
  });
}

class DetalleMedicamento extends StatelessWidget {
  final Medicamento medicamento;

  const DetalleMedicamento({required this.medicamento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('Detalle del Medicamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              medicamento.nombre,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(medicamento.cantidad),
            Text(medicamento.lote),
            Text(medicamento.fechaFabricacion),
            Text(medicamento.fechaCaducidad),
          ],
        ),
      ),
    );
  }
}