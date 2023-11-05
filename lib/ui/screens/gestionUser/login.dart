import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomovil/data/services/gestionUser/peticionesfirebaseuser.dart';
import 'package:proyectomovil/ui/screens/home/home.dart';
import 'package:proyectomovil/ui/screens/gestionUser/registrar.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var usuarios;
  void ingreso() {
    Peticioneslogin.ingresarEmail(emailController.text, passwordController.text)
        .then((user) {
      setState(() {
        print(user);
        if (user == '1' || user == '2') {
          usuarios = 'Correo No Existe o Contraseña Invalida';
        } else {
          try {
            usuarios = user.user.email;
            print("has iniado correctamente");
            Get.toNamed("/pacientes");
          } catch (e) {
            e.printError();
          }
        }
      });
    });
  }

  String message = '';
  void _navigateToRegistration() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegistrationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                                  // Get.to(const RecuperarContrasena());
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
                              print(emailController.text);
                              print(passwordController.text);
                              ingreso();
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
                            onPressed: _navigateToRegistration,
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
                          const SizedBox(height: 40),
                          Text(message,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 238, 25, 10))),
                          const SizedBox(height: inputSpacing),
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
