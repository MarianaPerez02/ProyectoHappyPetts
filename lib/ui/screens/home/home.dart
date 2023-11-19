import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectomovil/ui/screens/gestionUser/login.dart';
import 'dart:async';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) 
  {
    Future.delayed(const Duration(seconds: 3),()async{
      await Get.to(Login());
    });
    return Scaffold(      
      body: Stack(fit: StackFit.expand,
      children:<Widget> [Image.asset("assets/image/2.png",fit: BoxFit.cover,),

      ],),
    );
  }
}