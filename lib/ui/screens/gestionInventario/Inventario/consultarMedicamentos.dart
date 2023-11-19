import 'package:flutter/material.dart';

class ConsultarMedicamentos extends StatefulWidget {
  const ConsultarMedicamentos({super.key});

  @override
  ConsultarMedicamentosState createState() => ConsultarMedicamentosState();
}

class ConsultarMedicamentosState extends State<ConsultarMedicamentos> {
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
              height: 80, // Ajusta la altura de la imagen superior
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children:[
          Container(
            height: 2, // Altura deseada para el espacio superior
            color: Colors.red, // Fondo rojo        
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Nombre de Medicamento, Síntoma o Bacteria',
                    hintText: 'Ingrese su búsqueda',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para realizar la búsqueda
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    'Buscar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
