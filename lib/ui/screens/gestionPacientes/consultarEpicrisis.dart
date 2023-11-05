import 'package:flutter/material.dart';
import 'editarEpicrisis.dart';
import 'epicrisis.dart';

class ConsultarEpicrisis extends StatelessWidget {
  // Simulación de una lista de epicrisis; puedes cargar datos reales desde una base de datos
  final List<Epicrisis> epicrisisList = [
    Epicrisis(
      nombrePaciente: 'Mascota 1',
      especie: 'Perro',
      sexo: 'Macho',
      peso: 8.5,
      fechaIngreso: '2023-10-26',
      nombrePropietario: "pedro",
      apellidosPropietario:"javier",
      identificacionPropietario: "10320",
      direccionPropietario: "10#29-49"
    ),
    Epicrisis(
      nombrePaciente: 'Mascota 2',
      especie: 'Gato',
      sexo: 'Hembra',
      peso: 4.2,
      fechaIngreso: '2023-10-25',
      nombrePropietario: "malcom",
      apellidosPropietario:"javier",
      identificacionPropietario: "102220",
      direccionPropietario: "10#222-49"
    ),
    // Agrega más Epicrisis según tus necesidades
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          height: 100,
          color: Colors.white,
          child: Center(
            child: Image.asset(
              'assets/image/33.png', // Ajusta la ruta de la imagen según tu proyecto
              fit: BoxFit.cover,
              height: 80,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Consultar Epicrisis'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Epicrisis',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: epicrisisList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text('Nombre: ${epicrisisList[index].nombrePaciente}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Especie: ${epicrisisList[index].especie}'),
                        Text('Sexo: ${epicrisisList[index].sexo}'),
                        Text('Peso: ${epicrisisList[index].peso} kg'),
                        Text('Fecha de Ingreso: ${epicrisisList[index].fechaIngreso}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {


                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditarEpicrisis(epicrisis: epicrisisList[index]),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}