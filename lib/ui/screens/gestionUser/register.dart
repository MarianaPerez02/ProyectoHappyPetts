import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomovil/domain/controllers/gestionUser/controlleruser.dart';
import 'package:proyectomovil/ui/screens/gestionUser/login.dart';

class Register extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Register({super.key});


  @override
  Widget build(BuildContext context) {
    ControlUserAuth cua = ControlUserAuth();
    
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(20.0),
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  'assets/image/3.png',
                  width: 300,
                  height: 300,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.white,
                    //elevation: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            'REGISTRAR USUARIO NUEVO',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,  // Aumenta el tamaño de la fuente aquí
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: 'Nombre',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                            ),
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 30), //
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                            ),
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 30), //
                          TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                            ),
                            style: const TextStyle(fontSize: 15),
                          ),

                          const SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: () {
                              cua.crearUser(emailController.text,
                                  passwordController.text);
                                  emailController.clear();
                                  passwordController.clear();
                                  nameController.clear();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade900,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30.0), // Bordes circulares
                              ),
                            ),
                            child: const Text('Registrar',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                           const SizedBox(height: 40),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                '¿Ya tienes una cuenta?',
                                style: TextStyle(
                                    fontSize: 13,
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
                                      fontSize: 13, color: Colors.red.shade600),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
