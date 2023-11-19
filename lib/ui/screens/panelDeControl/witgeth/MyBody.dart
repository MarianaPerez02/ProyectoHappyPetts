import 'package:flutter/material.dart';

class mybody extends StatefulWidget {
  const mybody({super.key});

  @override
  State<mybody> createState() => mybodyState();
}

class mybodyState extends State<mybody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(5.0),
          color: Colors.red.shade900,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Buscar...",
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: 
                Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Lógica para el botón "Perro"
                      },
                      icon: const Icon(Icons.pets),
                      label: const Text("Perro"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // Color de fondo
                        foregroundColor: Colors.white, // Color del texto
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Lógica para el botón "Gato"
                      },
                      icon: const Icon(Icons.pets),
                      label: const Text("Gato"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Color de fondo
                        foregroundColor: Colors.white, // Color del texto
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Lógica para el botón "Conejo"
                      },
                      icon: const Icon(Icons.pets),
                      label: const Text("Conejo"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Color de fondo
                        foregroundColor: Colors.white, // Color del texto
                      ),
                    ),
                  ],
                ),
              ),
              // Resto de tu contenido en el cuerpo
            ],
          ),
        ),
      ),
    );
  }
}
