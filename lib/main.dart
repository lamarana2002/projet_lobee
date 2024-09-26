import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lobe/constantes.dart';
import 'package:lobe/screens/chargement.dart';


void main() {
  runApp(GetMaterialApp(
    theme: ThemeData().copyWith(
      inputDecorationTheme: const InputDecorationTheme().copyWith(
        labelStyle: 
                  const TextStyle(
                    fontSize: 20,
                    color: black,
                    fontWeight: FontWeight.bold,
                  ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
                    backgroundColor: gray,
                  ),
      ),
        listTileTheme: const ListTileThemeData(
          titleTextStyle: TextStyle(
              fontSize: 22, color: black, fontWeight: FontWeight.bold),
          subtitleTextStyle: TextStyle(
            fontSize: 17,color: black,
          ),
        ),
        textTheme: const TextTheme().copyWith(
          titleSmall: const TextStyle(
            fontSize: 30,
            color: black,
            fontWeight: FontWeight.bold,
          ),
        )),
    navigatorKey: Get.key,
    home: const Chargement(),
    debugShowCheckedModeBanner: false,
  ));
}
