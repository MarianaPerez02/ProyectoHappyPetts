import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomovil/domain/controllers/gestionUser/controlleruser.dart';
import 'package:proyectomovil/ui/screens/gestionUser/recuperarContrasena.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    
    ControlUserAuth cu = Get.find();

    const double inputSpacing = 20.0;
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
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Image.asset(),
                // )

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
                          const Text(
                            'INICIAR SESION',
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
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                            ),
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 30),
                          //
                          TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                            ),
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                '¿Has olvidad tu contraseña?',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                onPressed: () {
                                   Get.to(RecuperarContrasena());
                                },
                                child: Text(
                                  'Click',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.red.shade600),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: inputSpacing),
                          ElevatedButton(
                            onPressed: () {
                              cu
                                  .ingresarUser(emailController.text,
                                      passwordController.text)
                                  .then((value) {
                                if (cu.userValido == null) {
                                  Get.snackbar("Usuarios", cu.mensajesUser,
                                      duration: const Duration(seconds: 4),
                                      backgroundColor: Colors.amber);
                                } else {
                                  Get.offAllNamed('/panelDeControl');
                                }
                              });

                              emailController.clear();
                              passwordController.clear();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade900,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30.0), // Bordes circulares
                              ),
                            ),
                            child: const Text('Iniciar Sesión',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                          // const Text("\n" "_______________Or_____________"),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  height: 5,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Text(
                                  'O',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  height: 3,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          ElevatedButton(
                            onPressed: () {
                              Get.offAllNamed('/register');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade900,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30.0), // Bordes circulares
                              ),
                            ),
                            child: const Text('Registrarse',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                          const SizedBox(height: 25),
                          // Text(message,

                          //     style: const TextStyle(
                          //         color: Color.fromARGB(255, 238, 25, 10))),
                          // const SizedBox(height: inputSpacing),
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
