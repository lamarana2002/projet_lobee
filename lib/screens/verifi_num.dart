import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lobe/constantes.dart';
import 'package:lobe/screens/connexion.dart';
import 'package:lobe/screens/inscription.dart';
import 'package:lobe/widgets/button_submit.dart';

class VerifiNum extends StatefulWidget {
  const VerifiNum({super.key});

  @override
  State<VerifiNum> createState() => _VerifiNumState();
}

class _VerifiNumState extends State<VerifiNum> {
  Color scaffoldGradient = const Color.fromARGB(114, 0, 0, 0);
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.grey,
          scaffoldGradient,
          scaffoldGradient,
          scaffoldGradient
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/images/pana.svg'),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Vérifiez votre numéro',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                                'Merci de saisir le code que nous vous avons envoyé au ',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                            children: <TextSpan>[
                              const TextSpan(
                                text: '610 26 33 24',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const TextSpan(
                                text: '. ',
                              ),
                              TextSpan(
                                text: 'Modifier le numéro',
                                style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(const Inscription());
                                    // Action lorsque le texte "Modifier le numéro" est cliqué
                                    print('Modifier le numéro cliqué');
                                    // Vous pouvez naviguer ou afficher une boîte de dialogue ici
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  PinCodeFields(
                    length: 4,
                    fieldBorderStyle: FieldBorderStyle.square,
                    responsive: false,
                    fieldHeight: 70.0,
                    fieldWidth: 70.0,
                    borderWidth: 5.0,
                    activeBorderColor: Colors.blue,
                    activeBackgroundColor: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    autoHideKeyboard: false,
                    fieldBackgroundColor: Colors.black12,
                    borderColor: Colors.red,
                    textStyle: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    onComplete: (text) => print(text),
                  ),
                  const SizedBox(
                    height: default_padding,
                  ),
                  ButtonSubmit(
                    title: 'Se connecter',
                    textColor: white,
                    buttonColor: Colors.red,
                    onPressed: () {
                      Get.to(const Connexion());
                    },
                  ),
                  const SizedBox(
                    height: default_padding * 2,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Vous n'avez pas reçu le message?",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15, color: white),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: const Text(
                                "Renvoyez le code",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15, color: blue),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget codeNumber() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Container(
  //       width: 60,
  //       height: 60,
  //       decoration: BoxDecoration(
  //           border: Border.all(), borderRadius: BorderRadius.circular(10)),
  //     ),
  //   );
  // }
}
