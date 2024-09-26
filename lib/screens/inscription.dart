import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:lobe/constantes.dart';
import 'package:lobe/screens/verifi_num.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  TextEditingController textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color scaffoldGradient = const Color.fromARGB(114, 0, 0, 0);
    return Container(
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
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Sign in with',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 190,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: gray),
                          child: const Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundImage:
                                    AssetImage('assets/images/google-logo.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  'Google',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: black,
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 50,
                      width: 190,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: 30,
                              backgroundColor:
                                  const Color.fromARGB(193, 13, 56, 185)),
                          child: const Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                    'https://www.freepnglogos.com/uploads/facebook-logo-icon/facebook-logo-icon-facebook-logo-png-transparent-svg-vector-bie-supply-16.png'),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  'Facebook',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                FormBuilder(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SizedBox(
                      height: 300,
                      child: ListView(
                        children: [
                          formField('nom', 'Nom', Icons.person),
                          formField('prenom', 'Prenom', Icons.person),
                          formField('telephone', 'Telephone', Icons.phone),
                          formFieldPassword('password', 'Mot de Passe',
                              'Entrez votre mot de pass'),
                          formFieldPassword('password_confirmed', 'Confirmation',
                              'Confirmez votre mot de pass'),
                          FormBuilderCheckbox(
                              name: 'user_rule',
                              checkColor: Colors.white,
                              activeColor: Colors.red,
                              title: const Text(
                                'Accepter les conditions d\'utilisations',
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(()=>const VerifiNum());
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 30, backgroundColor: Colors.red),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget formLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget formField(String name, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FormBuilderTextField(
        name: name,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white,),
            labelText: label,
            labelStyle: const TextStyle(color: white),
            hintText: 'Entrez votre $label',
            hintStyle: const TextStyle(color: white),
            fillColor: Colors.red,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(20)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }

  Widget formFieldPassword(String name, String label, String hin) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FormBuilderTextField(
        name: name,
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.key, color: Colors.white,),
            labelText: label,
            labelStyle: const TextStyle(color: white),
            hintText: hin,
            hintStyle: const TextStyle(color: white),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(20)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }

  // void confirmPhone() async {
  //   showBottomSheet(
  //     context: context,
  //     builder: (ctx){
  //       return BottomSheet(
  //         onClosing: (){},
  //         builder: (ct) => Container(
  //       width: double.infinity,
  //       height: MediaQuery.of(context).size.height / 1.5,
  //       decoration: const BoxDecoration(
  //           color: white,
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(20),
  //             topRight: Radius.circular(20),
  //           )),
  //       child: Column(
  //         children: [
  //           const Text(
  //             'Confirmer votre numero de telephone',
  //             style: TextStyle(
  //               fontSize: 20,
  //               fontWeight: FontWeight.bold,
  //               color: black
  //             ),
  //           ),
  //           PinCodeTextField(
  //             appContext: context,
  //             length: 4,
  //             obscureText: false,
  //             textStyle: const TextStyle(
  //               color: black,
  //             ),
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             animationType: AnimationType.fade,
  //             pinTheme: PinTheme(
  //                 shape: PinCodeFieldShape.box,
  //                 borderRadius: BorderRadius.circular(15),
  //                 fieldHeight: 70,
  //                 fieldWidth: 70,
  //                 activeFillColor: Colors.white,
  //                 inactiveFillColor: Colors.white,
  //                 inactiveColor: gray,
  //                 selectedFillColor: white),
  //             animationDuration: Duration(milliseconds: 300),
  //             enableActiveFill: true,
  //             // errorAnimationController: errorController,
  //             controller: textEditingController,
  //             onCompleted: (v) {
  //               print("Completed");
  //             },
  //             onChanged: (value) {
  //               print(value);
  //               setState(() {
  //                 // currentText = value;
  //               });
  //             },
  //             beforeTextPaste: (text) {
  //               print("Allowing to paste $text");
  //               //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
  //               //but you can show anything you want here, like your pop up saying wrong paste format or etc
  //               return true;
  //             },
  //           ),
  //         ],
  //       ),
  //     ));
  //     });
  //   // Get.bottomSheet(StatefulBuilder(builder: (context, setState) {
  //   //   return
  //   // }));
  // }
}
