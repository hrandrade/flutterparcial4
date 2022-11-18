import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterparcial4/pantallas/principal.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Parcial());
}

class Parcial extends StatelessWidget {
  const Parcial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mantenimiento Clientes',
      home: SplahsInit(),
    );
  }
}


class SplahsInit extends StatelessWidget {
  const SplahsInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:       
      Column(
        children: [
           Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/flutter.gif'), fit: BoxFit.cover),
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.tealAccent.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(100)),
                ),
          
          SizedBox(height: 20,),
          const Text('PARCIAL 4', 
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
        ],
      ), 
      backgroundColor: Colors.tealAccent,
      nextScreen: Clientes(),
      splashIconSize: 250,
      duration: 5000,
      animationDuration: const Duration(seconds: 1),
      pageTransitionType: PageTransitionType.fade,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}