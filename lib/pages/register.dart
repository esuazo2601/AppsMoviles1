import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  final _nombre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Acceder"),
          backgroundColor: Colors.grey,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                    child: Image.asset(
                  'assets/escudo.gif',
                  height: 150,
                  width: 250,
                )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors
                      .white, // Color de fondo para la sección de usuario y contraseña
                  padding: const EdgeInsets.all(
                      20.0), // Espaciado interno del contenedor
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Usuario"),
                      TextFormField(
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Contraseña"),
                      TextFormField(
                        obscureText: true,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Repetir Contraseña"),
                      TextFormField(
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Nombre"),
                      TextFormField(
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      // if (_userController.text == "dido" &&
                      //     _passwordController.text == "123") {
                      //   print("Loguear");
                      // } else {
                      //   MotionToast.error(
                      //           title: const Text("Error"),
                      //           description: const Text(
                      //               "Usuario o contraseña incorrectos"))
                      //       .show(context);
                      // }
                    },
                    child: const Text("GUARDAR")),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("VOLVER"),
                ),
              ],
            ),
          ),
        ));
  }
}
