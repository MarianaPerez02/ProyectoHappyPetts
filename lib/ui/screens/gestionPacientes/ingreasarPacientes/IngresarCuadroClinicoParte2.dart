import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyectomovil/data/services/pacienteServices.dart';
import 'package:proyectomovil/domain/models/paciente.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class IngresarDatosCuadroClinicoParte2 extends StatefulWidget {
  final Paciente paciente;

  const IngresarDatosCuadroClinicoParte2({
    super.key,
    required this.paciente,
  });

  @override
  _IngresarDatosCuadroClinicoParte2State createState() =>
      _IngresarDatosCuadroClinicoParte2State();
}

class _IngresarDatosCuadroClinicoParte2State
    extends State<IngresarDatosCuadroClinicoParte2> {
  final TextEditingController evolucionController = TextEditingController();
  final TextEditingController diagnosticoFinalController =
      TextEditingController();
  final TextEditingController medicamentosRecomendadosController =
      TextEditingController();
  final TextEditingController cuidadosController = TextEditingController();
  final TextEditingController fechaSalidaController = TextEditingController();
  final TextEditingController fechaSeguimientoController =
      TextEditingController();
  final TextEditingController firmaVeterinarioController =
      TextEditingController();

  DateTime? selectedDate;
  String? image;
  String? imageUrl;

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _getImage() async {
    try {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Seleccionar Imagen"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.camera),
                    title: const Text('Tomar foto'),
                    onTap: () async {
                      Navigator.pop(context);
                      final XFile? pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      if (pickedFile != null) {
                        setState(() => image = pickedFile.path);
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text('Seleccionar desde Galería'),
                    onTap: () async {
                      Navigator.pop(context);
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['jpg', 'jpeg', 'png'],
                      );
                      if (result != null && result.files.isNotEmpty) {
                        final File selectedImage =
                            File(result.files.single.path!);

                        // Asegúrate de que la imagen tenga la extensión adecuada
                        if (result.files.single.extension == 'jpg' ||
                            result.files.single.extension == 'jpeg' ||
                            result.files.single.extension == 'png') {
                          setState(() => image = selectedImage.path);
                        } else {
                          // Muestra un mensaje de error si la extensión no es válida
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Selecciona una imagen válida en formato JPG o PNG.'),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    } catch (e) {
      e.printError();
    }
  }

  Future<void> _uploadImage(String pacienteId) async {
    try {
      if (image != null) {
        File imageFile = File(image!);
        final ext = imageFile.path.split('.').last.toLowerCase();

        if (ext == 'png' || ext == 'jpg' || ext == 'jpeg') {
          var uploadTask = await firebase_storage.FirebaseStorage.instance
              .ref('pacientes/$pacienteId/${DateTime.now()}.$ext')
              .putFile(imageFile);

          debugPrint('Subida completada');
          imageUrl = await uploadTask.ref.getDownloadURL();
        } else {
          debugPrint(
              'Formato de imagen no válido. Solo se permiten archivos .png o .jpg.');
        }
      }
    } catch (e) {
      debugPrint('Error al cargar la imagen: $e');
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
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.red,
                    height: 2,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Ingresar Paciente',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Cuadro Clínico',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ExpandingTextField(
                    controller: evolucionController,
                    labelText: 'Evolución',
                  ),
                  const SizedBox(height: 16),
                  ExpandingTextField(
                    controller: diagnosticoFinalController,
                    labelText: 'Diagnóstico Final',
                  ),
                  const SizedBox(height: 16),
                  ExpandingTextField(
                    controller: medicamentosRecomendadosController,
                    labelText: 'Medicamentos Recomendados',
                  ),
                  const SizedBox(height: 16),
                  ExpandingTextField(
                    controller: cuidadosController,
                    labelText: 'Cuidados',
                  ),
                  const SizedBox(height: 16),
                  DatePickerField(
                    controller: fechaSalidaController,
                    labelText: 'Fecha de Salida',
                    onTap: () => _selectDate(context, fechaSalidaController),
                  ),
                  const SizedBox(height: 16),
                  DatePickerField(
                    controller: fechaSeguimientoController,
                    labelText: 'Fecha de Seguimiento',
                    onTap: () =>
                        _selectDate(context, fechaSeguimientoController),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: _getImage,
                    child: Center(
                      child: ImageFile(
                        image: image,
                        imageAssets: 'assets/image/take_photo.jpg',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await _uploadImage(widget.paciente.id);

                        Paciente cuadroClinicoFinal = Paciente(
                          id: widget.paciente.id,
                          nombre: widget.paciente.nombre,
                          especie: widget.paciente.especie,
                          edad: widget.paciente.edad,
                          sexo: widget.paciente.sexo,
                          peso: widget.paciente.peso,
                          fechaIngreso: widget.paciente.fechaIngreso,
                          nPropietario: widget.paciente.nPropietario,
                          aPropietario: widget.paciente.aPropietario,
                          identPropietario: widget.paciente.identPropietario,
                          direccionPropietario:
                              widget.paciente.direccionPropietario,
                          telefonoPropietario:
                              widget.paciente.telefonoPropietario,
                          emailPropietario: widget.paciente.emailPropietario,
                          sintomas: widget.paciente.sintomas,
                          examenFisico: widget.paciente.examenFisico,
                          medicamentos: widget.paciente.medicamentos,
                          dosificacion: widget.paciente.dosificacion,
                          viaAdmin: widget.paciente.viaAdmin,
                          descProcedimiento: widget.paciente.descProcedimiento,
                          evolucion: evolucionController.text,
                          diagnostico: diagnosticoFinalController.text,
                          medicamentoRecomendado:
                              medicamentosRecomendadosController.text,
                          cuidados: cuidadosController.text,
                          fechasalida: fechaSalidaController.text,
                          fechaseguimiento: fechaSeguimientoController.text,
                          imagenUrl: imageUrl!,
                        );

                        await PacienteServices()
                            .enviarDatosAFirebase(cuadroClinicoFinal);

                        // Navegar a la pantalla de control u otra pantalla
                        // ignore: use_build_context_synchronously
                        Get.offAllNamed('/panelDeControl');
                      } catch (e) {
                        e.printError();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 70,
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child:
                        const Text('Guardar', style: TextStyle(fontSize: 20)),
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

class ExpandingTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  const ExpandingTextField({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  _ExpandingTextFieldState createState() => _ExpandingTextFieldState();
}

class _ExpandingTextFieldState extends State<ExpandingTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.grey.shade400,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class DatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final VoidCallback onTap;

  const DatePickerField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: onTap,
      readOnly: true,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.grey.shade400,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class ImageFile extends StatelessWidget {
  final String? image;
  final String imageAssets;

  const ImageFile({
    super.key,
    required this.image,
    required this.imageAssets,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: image != null
          ? Image.file(
              File(image!),
              fit: BoxFit.cover,
            )
          : Image.asset(
              imageAssets,
              fit: BoxFit.cover,
            ),
    );
  }
}
