import 'package:flutter/material.dart';
import 'detalleMedicamento.dart'; // Importa el archivo de detalleMedicamento

class ConsultarInventario extends StatelessWidget {
  const ConsultarInventario({super.key});

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
        title: const Text('Inventario'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Buscar por nombre de medicamento',
                hintText: 'Ingrese su búsqueda',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Número de medicamentos (puedes cambiarlo según tus necesidades)
              itemBuilder: (BuildContext context, int index) {
                final medicamento = Medicamento(
                  nombre: 'Medicamento $index',
                  cantidad: 'Cantidad: 10',
                  lote: 'Lote: 1234',
                  fechaFabricacion: 'Fabricación: 01/01/2022',
                  fechaCaducidad: 'Caducidad: 01/01/2023',
                );

                return MedicamentoCard(
                  medicamento: medicamento,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalleMedicamento(medicamento: medicamento),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MedicamentoCard extends StatelessWidget {
  final Medicamento medicamento;
  final VoidCallback onPressed;

  const MedicamentoCard({super.key, required this.medicamento, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              medicamento.nombre,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(medicamento.cantidad),
            Text(medicamento.lote),
            Text(medicamento.fechaFabricacion),
            Text(medicamento.fechaCaducidad),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Ver'),
            ),
          ],
        ),
      ),
    );
  }
}