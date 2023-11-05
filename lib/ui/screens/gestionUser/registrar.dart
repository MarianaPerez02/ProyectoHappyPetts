import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectomovil/data/services/gestionUser/peticionesfirebaseuser.dart';
import 'package:proyectomovil/ui/screens/screens.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final Peticioneslogin auth = Peticioneslogin();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var usuarior;
  Future<void> registro() async {
    await Peticioneslogin.crearRegistroEmail(
            emailController.text, passwordController.text)
        .then((user) {
      print(user);
      if (user == '1' || user == '2') {
        usuarior = 'Correo Ya Existe o Contraseña Debil';
      } else {
        usuarior = user.user.email;
      }
    });
  }

  String errorMessage = '';
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
                          const SizedBox(height: 15),
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
                              registro();
                              nameController.clear();
                              emailController.clear();
                              passwordController.clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
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
                          const SizedBox(
                            height: 20,
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




// child: Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(20.0),
//             color: Colors.white,
//             child: Center(
//               child: Column(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.asset('assets/image/3.png'),
//                   ),
//                   const SizedBox(height: 20),
//                   TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(labelText: 'Gmail'),
//                   ),
//                   TextField(
//                     controller: passwordController,
//                     decoration: const InputDecoration(labelText: 'Contraseña'),
//                     obscureText: true,
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                        registro();
//                       nameController.clear();
//                       passwordController.clear();
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const Login()));
//                     },
//                     style:
//                         ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                     child: const Text('Registrarse',
//                         style: TextStyle(color: Colors.white)),
//                   ),
//                   Text(errorMessage, style: const TextStyle(color: Colors.red)),
//                 ],
//               ),
//             ),
//           ),