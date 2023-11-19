import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:proyectomovil/data/services/inventario_services.dart';
import 'package:proyectomovil/domain/models/inventario.dart';

class ConsultasInventarioController extends GetxController {
  final Rxn<List<Inventario>> _servicioFirestore = Rxn<List<Inventario>>([]);
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> consultarInventario() async {
    _servicioFirestore.value = await InventarioServices.listarInventario();
  }

  Future<void> actualizarInventario(
      String id, Map<String, dynamic> datos) async {
    await InventarioServices.actualizarInventario(id, datos);
  }



  Future<void> eliminarInventario(String id) async {
    await InventarioServices.eliminarInventario(id);
    _servicioFirestore.value?.removeWhere((servicio) => servicio.id == id);
  }
   void searchInventario(String searchTerm) {
    if (searchTerm.isEmpty) {
      consultarInventario();
    } else {
      _servicioFirestore.value = _servicioFirestore.value
          ?.where((medicamento) =>
              medicamento.nombre.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    }
  }

  List<Inventario>? get listaFinalServicio => _servicioFirestore.value;
}
