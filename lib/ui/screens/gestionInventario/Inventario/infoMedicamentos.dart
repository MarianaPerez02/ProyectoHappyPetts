import 'package:flutter/material.dart';

class InfoMedicamentos extends StatefulWidget {
  const InfoMedicamentos({super.key});

  @override
  State<InfoMedicamentos> createState() => _InfoMedicamentosState();
}

class _InfoMedicamentosState extends State<InfoMedicamentos> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body: InfoMed()
    );
  }
}
class Espaciado extends StatelessWidget {
  const Espaciado({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 16.0);
  }
}


class InfoMed extends StatelessWidget {
  const InfoMed({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
            height: 2, // Altura deseada para el espacio superior
            color: Colors.red, // Fondo rojo        
          ),

          
            const SizedBox(height: 20),
            Image.asset(
              'assets/image/4.png', // Reemplaza con la ruta de tu imagen
              fit: BoxFit.cover,
              height: 100, // Ajusta la altura de la imagen
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(labelText: 'Nombre del Medicamento'),
            ),
            const  Espaciado(),
            const TextField(
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            const  Espaciado(),
            const TextField(
              decoration: InputDecoration(labelText: 'Especie'),
            ),
           const  Espaciado(),
            const TextField(
              decoration: InputDecoration(labelText: 'Dosificación'),
            ),
            const  Espaciado(),
            const TextField(
              decoration: InputDecoration(labelText: 'Frecuencia'),
            ),
            const  Espaciado(),
            const TextField(
              decoration: InputDecoration(labelText: 'Vía de Administración'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción para guardar la información del medicamento
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                disabledBackgroundColor: Colors.white,
              ),
              child: const Text('Guardar'),
            ),
          ],
        ),
      );
  }
}