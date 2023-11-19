import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomovil/domain/controllers/gestionUser/controlleruser.dart';
import 'package:proyectomovil/ui/screens/gestionUser/login.dart';

class RecuperarContrasena extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ControlUserAuth cua = Get.find();
    const double inputSpacing = 20.0;

    return Scaffold(
      
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/3.png',
                  width: 300,
                  height: 300,
                ),
               
                const SizedBox(height: 30),
                const Text(
                            'RECUPERAR CONTRASEÑA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,  // Aumenta el tamaño de la fuente aquí
                            ),
                          ),
                          const SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    cua.resetPassword(emailController.text).then((value) {
                       emailController.clear();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade900, // Color personalizado
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('Enviar solicitud de restablecimiento',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
                const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                '¿Ya tienes cuenta?',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                onPressed: () {
                                   Get.to(Login());
                             
                                },
                                child: Text(
                                  'Ingreso',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.red.shade600),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: inputSpacing),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
