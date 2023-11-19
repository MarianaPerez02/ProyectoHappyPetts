import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomovil/domain/controllers/gestionUser/controllerInventario.dart';
import 'package:proyectomovil/domain/models/inventario.dart';
import 'package:proyectomovil/ui/screens/gestionInventario/detallesInventario.dart';

class ConsultasInventario extends StatelessWidget {
  const ConsultasInventario({super.key});

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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                _searchInventario(value);
              },
              decoration: const InputDecoration(
                labelText: 'Buscar por nombre de medicamento',
                hintText: 'Ingrese su búsqueda',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          const Expanded(child: ConsultarInventario()),
        ],
      ),
    );
  }

  void _searchInventario(String searchTerm) {
    ConsultasInventarioController sc = Get.find();
    sc.searchInventario(searchTerm);
  }
}

class ConsultarInventario extends StatelessWidget {
  const ConsultarInventario({super.key});

  @override
  Widget build(BuildContext context) {
    ConsultasInventarioController sc = Get.find();
    sc.consultarInventario();
    return Scaffold(
      body: Obx(() {
        final List<Inventario>? _servicios = sc.listaFinalServicio;
        if (sc.listaFinalServicio?.isEmpty == true) {
          return const Center(
            child: Text("No existen Medicamentos registrados"),
          );
        } else {
          return ListView.builder(
            itemCount: sc.listaFinalServicio!.length,
            itemBuilder: (context, posicion) {
              final servicio = _servicios![posicion];
              return Card(
                margin: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      _openHabitacionDetails(context, servicio);
                    },
                    child: Row(
                      children: [
                        // SizedBox(
                        //   height: 150,
                        //   width: 150,
                        //   child: getImageWidget(
                        //       sc.listaFinalServicio![posicion].imagen),
                        // ),
                        // const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      sc.listaFinalServicio![posicion].nombre),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "Cantidad: ${sc.listaFinalServicio![posicion].cantidad}"),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "Lote: ${sc.listaFinalServicio![posicion].lote}"),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "Fabricación: ${sc.listaFinalServicio![posicion].fechaFabricacion}"),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "Caducidad: ${sc.listaFinalServicio![posicion].fechaCaducidad}"),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "Descripcion: ${sc.listaFinalServicio![posicion].descripcion}"),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "Dosificación: ${sc.listaFinalServicio![posicion].dosificicacion}"),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "Frecuencia: ${sc.listaFinalServicio![posicion].frecuencia}"),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "Via Administracion: ${sc.listaFinalServicio![posicion].viaAdministracion}"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _openHabitacionDetails(context, servicio);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text('Ver'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit_note_outlined,
                                size: 30,
                                color: Colors.indigo,
                              ),
                              onPressed: () {
                                Get.toNamed('/editarMedicamento',
                                    arguments:
                                        sc.listaFinalServicio![posicion]);
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete_outline_rounded,
                                size: 30,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                _showConfirmationDialog(context, sc, posicion);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/agregarMedicamento');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showConfirmationDialog(
      BuildContext context, ConsultasInventarioController sc, int posicion) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirmar eliminación"),
          content: const Text(
              "¿Estás seguro de que deseas eliminar este medicamento?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                sc.eliminarInventario(sc.listaFinalServicio![posicion].id);
                Navigator.of(context).pop();
                sc.consultarInventario();
              },
              child: const Text("Eliminar"),
            ),
          ],
        );
      },
    );
  }

  void _openHabitacionDetails(BuildContext context, servicio) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InventarioDetalles(servicio: servicio),
      ),
    );
  }
}
