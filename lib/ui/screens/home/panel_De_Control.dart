import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomovil/ui/screens/gestionInventario/Inventario/consultarInventario.dart';
import 'package:proyectomovil/ui/screens/gestionInventario/ingresarMedicamento/ingresarMedicamentos.dart';
import 'package:proyectomovil/ui/screens/gestionPacientes/epicrisisClinica/consultarEpicrisis.dart';
import 'package:proyectomovil/ui/screens/gestionPacientes/ingreasarPacientes/ingresarPacientes.dart';
import 'package:proyectomovil/ui/screens/gestionUser/login.dart';

// Asegúrate de importar el archivo correctamente

class PanelDeControl extends StatelessWidget {
  const PanelDeControl({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/image/6.png', // Asegúrate de reemplazar 'assets/imagen3.png' con la ruta de tu imagen.
              fit: BoxFit.contain,
              height: 60,
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white, // Cambiar el color de fondo a blanco
        iconTheme: const IconThemeData(
            color: Color.fromARGB(
                255, 10, 7, 7)), // Cambiar el color del icono de la barra
      ),
      drawer: const MyDrawer(),
      body: const mybody(),
    );
  }
}

class mybody extends StatefulWidget {
  const mybody({super.key});

  @override
  State<mybody> createState() => mybodyState();
}

class mybodyState extends State<mybody> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: Row(
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
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                color: Colors.white, // Color de fondo blanco
                padding: const EdgeInsets.only(top: 40), // Espacio arriba
                child: ListTile(
                  title: Image.asset(
                    'assets/image/jaja.jpg',
                    width: 100, // Tamaño más grande
                    height: 100, // Tamaño más grande
                  ),
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nombre de Usuario', style: TextStyle(fontSize: 14.0)),
                  Text('Administrador', style: TextStyle(fontSize: 12.0)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          ListTile(
            title: Row(
              children: [
                const SizedBox(width: 11),
                const Icon(
                  Icons.person_add,
                  weight: 25,
                ),
                DropdownButton(
                    hint: const Text('Gestion Pacientes',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    value: null,
                    items: const [
                      DropdownMenuItem(
                        value: 'ingresarPacientes',
                        child: Text('Ingresar Pacientes'),
                      ),
                      DropdownMenuItem(
                        value: 'epicrisis_clinica',
                        child: Text('Epirisis Clínica'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value == 'ingresarPacientes') {
                        Get.to(IngresarPaciente());
                      } else if (value == 'epicrisis_clinica') {
                        Get.to(ConsultarEpicrisis());
                      }
                    }),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                const SizedBox(width: 11),
                const Icon(
                  Icons.inventory_rounded,
                  weight: 25,
                ),
                DropdownButton(
                  hint: const Text('Control de Inventario',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  value:
                      null, // Puedes manejar el valor seleccionado si es necesario
                  items: const [
                    DropdownMenuItem(
                      value: 'ingresarMaedicamento',
                      child: Text(
                        'Ingresar Medicamento',
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'inventario',
                      child: Text('Inventario'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value == 'ingresarMaedicamento') {
                      Get.to(const IngresarMedicamento());
                    } else if (value == 'inventario') {
                      Get.to(const ConsultasInventario());
                    }
                  },
                ),
              ],
            ),
          ),
          ListTile(
            title: const Row(
              children: [
                SizedBox(width: 65), // Espacio izquierdo
                Icon(
                  Icons.logout, // Ajusta el icono a tu elección
                  color: Colors.red, // Cambia el color del icono a rojo
                ),
                SizedBox(width: 10), // Espacio entre el icono y el texto
                Text(
                  'Cerrar Sesión',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red), // Ajusta el color del texto a rojo
                ),
              ],
            ),
            onTap: () {
              Get.to(
                  Login()); // Agregar la lógica para cerrar la sesión del usuario
            },
          ),
        ],
      ),
    );
  }
}
