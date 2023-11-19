import 'package:flutter/material.dart';
import 'package:proyectomovil/domain/models/inventario.dart';

class InventarioDetalles extends StatelessWidget {
  final Inventario servicio;

  const InventarioDetalles({super.key, required this.servicio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text('Detalle del Medicamento'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ServicioCoverWidget(coverUrl: servicio.imagen),
            ServicioInfoWidget(
              nombre: servicio.nombre,
              cantidad: "Cantidad: ${servicio.cantidad}",
              lote: "Lote: ${servicio.lote}",
              fabricacion: "Fabricación: ${servicio.fechaFabricacion}",
              caducidad: "Caducidad: ${servicio.fechaCaducidad}",
              descripcion: "Descripción: ${servicio.descripcion}",
              dosificacion: "Dosificacion: ${servicio.dosificicacion}",
              frecuencia: "Frecuencia: ${servicio.frecuencia}",
              viaAdmi: "Via Administracion: ${servicio.viaAdministracion}",
            ),
          ],
        ),
      ),
    );
  }
}

// class ServicioCoverWidget extends StatelessWidget {
//   final String coverUrl;
//   const ServicioCoverWidget({super.key, required this.coverUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 20, bottom: 20),
//       width: 400,
//       decoration: BoxDecoration(boxShadow: [
//         BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 5,
//             blurRadius: 10)
//       ]),
//       child: getImageWidget(coverUrl),
//     );
//   }

//   getImageWidget(String imagenes) {
//     if (imagenes.startsWith("http")) {
//       return Image.network(imagenes, height: 150, width: 150);
//     } else {
//       return Image.asset(imagenes, height: 150, width: 150);
//     }
//   }
// }

class ServicioInfoWidget extends StatelessWidget {
  final String nombre;
  final String cantidad;
  final String lote;
  final String fabricacion;
  final String caducidad;
  final String descripcion;
  final String dosificacion;
  final String frecuencia;
  final String viaAdmi;

  const ServicioInfoWidget(
      {super.key,
      required this.nombre,
      required this.cantidad,
      required this.lote,
      required this.fabricacion,
      required this.caducidad,
      required this.descripcion,
      required this.dosificacion,
      required this.frecuencia,
      required this.viaAdmi});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nombre,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            cantidad,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            lote,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            fabricacion,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            caducidad,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            descripcion,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            dosificacion,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            frecuencia,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            viaAdmi,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

// class ImageWidget extends StatelessWidget {
//   final String imagen;

//   const ImageWidget({
//     Key? key,
//     required this.imagen,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     if (imagen.startsWith("http")) {
//       return Image.network(imagen, height: 150, width: 150);
//     } else {
//       return Image.asset(imagen, height: 150, width: 150);
//     }
//   }
// }
