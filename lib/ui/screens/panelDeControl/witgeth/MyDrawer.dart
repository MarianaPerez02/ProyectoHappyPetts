import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomovil/ui/screens/gestionInventario/Inventario/consultarInventario.dart';
import 'package:proyectomovil/ui/screens/gestionInventario/ingresarMedicamento/ingresarMedicamentos.dart';
import 'package:proyectomovil/ui/screens/gestionPacientes/epicrisisClinica/consultarEpicrisis.dart';
import 'package:proyectomovil/ui/screens/gestionPacientes/ingreasarPacientes/ingresarPacientes.dart';
import 'package:proyectomovil/ui/screens/gestionUser/login.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10.0),
            color: Colors.white,
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.white, // Color de fondo blanco
                      padding: const EdgeInsets.only(top: 40), // Espacio arriba
                      child: ListTile(
                        title: Image.asset(
                          'assets/image/3.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                    // const Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text('Nombre de Usuario', style: TextStyle(fontSize: 14.0)),
                    //     Text('Administrador', style: TextStyle(fontSize: 12.0)),
                    //   ],
                    // ),
                  ],
                ),
                const SizedBox(height: 40),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 16, top: 5, bottom: 5),
                  leading: Image.asset(
                    'assets/image/paw-solid.png', // Ruta al archivo de icono
                    width: 24,
                    height: 24,
                  ),
                  title: Row(
                    children: [
                      // const SizedBox(width: 11),
                      DropdownButton(
                          hint: const Text('Gestion Pacientes          ',
                              style: TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black)),
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
                  contentPadding: EdgeInsets.only(left: 16, top: 5, bottom: 5),
                  leading: Image.asset(
                    'assets/image/cart-flatbed-solid.png', // Ruta al archivo de icono
                    width: 24,
                    height: 24,
                  ),
                  title: Row(
                    children: [
                      
                      DropdownButton(
                        hint: const Text('Gestion Medicamentos',
                              style: TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          value: null, // Puedes manejar el valor seleccionado si es necesario
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
                const SizedBox(height: 300),
                ListTile(
                  title: const Row(
                    children: [
                      SizedBox(width: 5), // Espacio izquierdo
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
                            color:
                                Colors.red), // Ajusta el color del texto a rojo
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
          ),
        ),
      ),
    );
  }
}
