import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomovil/data/services/inventario_services.dart';
import 'package:proyectomovil/domain/models/inventario.dart';
import 'package:proyectomovil/ui/screens/home/panel_De_Control.dart';

class EditarMedicamento extends StatelessWidget {
  const EditarMedicamento({super.key});

  @override
  Widget build(BuildContext context) {
    final Inventario? servicio = Get.arguments as Inventario?;
    return Scaffold(
      appBar: AppBar(
        title: Text(servicio != null ? 'Editar Medicamento' : 'Agregar Servicio'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: AicionarInfoMedicamento(servicio: servicio),
    );
  }
}

class AicionarInfoMedicamento extends StatefulWidget {
  final Inventario? servicio;
  const AicionarInfoMedicamento({super.key, this.servicio});

  @override
  State<AicionarInfoMedicamento> createState() =>
      AicionarInfoMedicamentoState();
}

class AicionarInfoMedicamentoState extends State<AicionarInfoMedicamento> {
  final nombretextController = TextEditingController();
  final cantidadtextController = TextEditingController();
  final lotetextController = TextEditingController();
  final fechatextFabricacionController = TextEditingController();
  final fechatextCaducidadController = TextEditingController();
  final descripciontextController = TextEditingController();
  final dosificaciontextController = TextEditingController();
  final frecuenciatextController = TextEditingController();
  final viaAdministraciontextController = TextEditingController();
  Map<String, dynamic>? medicamento;
  String? image;

  @override
  void initState() {
    super.initState();
    if (widget.servicio != null) {
      nombretextController.text = widget.servicio!.nombre;
      cantidadtextController.text = widget.servicio!.cantidad;
      lotetextController.text = widget.servicio!.lote;
      fechatextFabricacionController.text = widget.servicio!.fechaFabricacion;
      fechatextCaducidadController.text = widget.servicio!.fechaCaducidad;
      descripciontextController.text = widget.servicio!.descripcion;
      dosificaciontextController.text = widget.servicio!.dosificicacion;
      frecuenciatextController.text = widget.servicio!.frecuencia;
      viaAdministraciontextController.text = widget.servicio!.viaAdministracion;
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
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    height: 2,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Ingresar Medicamento',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Datos del Medicamento',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30.0),
                  TextField(
                    controller: nombretextController,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: cantidadtextController,
                    decoration: InputDecoration(
                      labelText: 'Cantidad del Medicamento',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: lotetextController,
                    decoration: InputDecoration(
                      labelText: 'Lote del Medicamento',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: fechatextFabricacionController,
                    decoration: InputDecoration(
                      labelText: 'Fecha de Fabricación (dd/mm/yyyy)',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: fechatextCaducidadController,
                    decoration: InputDecoration(
                      labelText: 'Fecha de Caducidad (dd/mm/yyyy)',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: descripciontextController,
                    decoration: InputDecoration(
                      labelText: 'Descripción',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: dosificaciontextController,
                    decoration: InputDecoration(
                      labelText: 'Dosificacion',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: frecuenciatextController,
                    decoration: InputDecoration(
                      labelText: 'Frecuencia',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: viaAdministraciontextController,
                    decoration: InputDecoration(
                      labelText: 'Via Administracion',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      await InventarioServices().updateMedicamento(
                          widget.servicio!.id,
                          descripciontextController.text,
                          dosificaciontextController.text,
                          frecuenciatextController.text,
                          viaAdministraciontextController.text);
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PanelDeControl(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 20), // Ajusta el tamaño del botón
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              30)), // Hace que los bordes del botón sean redondeados
                    ),
                    child: const Text('Actualizar Medicamento',
                        style: TextStyle(fontSize: 20)),
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
