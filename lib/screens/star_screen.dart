import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lobe/constantes.dart';
import 'package:lobe/screens/inscription.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StarScreen extends StatefulWidget {
  const StarScreen({super.key});

  @override
  State<StarScreen> createState() => _StarScreenState();
}

class _StarScreenState extends State<StarScreen> {
  int progression = 0; // Pour la progreesion de la bar
  int counter = 0; // Pour compter le nombre de seconde
  Timer? timer;
  Color scaffoldGradient = const Color.fromARGB(227, 0, 0, 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     starTimer(); // Appele de la fonction qui vas charger le progression puis afficher la page WriteNumber
  }

  void starTimer() async {
    // timer var s'executer a chaque une seconde
    timer = Timer.periodic(const Duration(seconds: 1), (time) {
      if (counter == 10) {
          // Si le nombre de seconde atteint 15 passe a la page suivante
           setState(() {
             timer?.cancel();
             Get.to(const Inscription());
           });
        }
      else{
        setState((){
        progression = progression + 10;
        counter++;
      });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.grey,scaffoldGradient,scaffoldGradient,scaffoldGradient
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
              )
            ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(children: [
            Container(
              width: double.infinity,
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height/1.3,
              child: Image.asset('assets/images/image-1.png'),
            ),
            const SizedBox(height: 10,),
            const Text(
              'Bienvenue',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              'Ensemble nous irons loin',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
                width: 200,
                child: StepProgressIndicator(
                  totalSteps: 100,
                  currentStep: progression,
                  size: 8,
                  padding: 0,
                  selectedColor: blue,
                  unselectedColor: gray,
                  roundedEdges: const Radius.circular(10),
                ),
              ),
          ],),
        ),
      ),
    );
  }
}