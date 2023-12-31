import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
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

  bool areFieldsFilled() {
    return _userController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _rePasswordController.text.isNotEmpty &&
        _nombre.text.isNotEmpty;
  }

  bool passMatch() {
    return _passwordController.text == _rePasswordController.text;
  }

  Future<bool> userExist() async {
    final prefs = await SharedPreferences.getInstance();
    final cUserName = prefs.getString('username');
    if (cUserName == null) {
      return false;
    } else {
      return cUserName == _userController.text;
    }
  }

  Future<void> saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final username = _userController.text;
    final password = _passwordController.text;
    final nombre = _nombre.text;

    // Guarda los datos en SharedPreferences
    await prefs.setString('username', username);
    await prefs.setString('password', password);
    await prefs.setString('nombre', nombre);
  }

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
                        controller: _userController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Contraseña"),
                      TextFormField(
                        obscureText: true,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        controller: _passwordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Repetir Contraseña"),
                      TextFormField(
                        obscureText: true,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        controller: _rePasswordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Nombre"),
                      TextFormField(
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        controller: _nombre,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (!areFieldsFilled()) {
                        MotionToast.error(
                                title: const Text("Error"),
                                description: const Text(
                                    "Debe rellenar todos los campos"))
                            .show(context);
                        return;
                      }
                      if (!passMatch()) {
                        MotionToast.error(
                                title: const Text("Error"),
                                description:
                                    const Text("Las contraseñas no coinciden"))
                            .show(context);
                        return;
                      }
                      if (await userExist()) {
                        MotionToast.error(
                                title: const Text("Error"),
                                description: const Text("El usuario ya existe"))
                            .show(context);
                        return;
                      }
                      await saveUserData();
                      MotionToast.success(
                              title: const Text("Éxito"),
                              description:
                                  const Text("Usuario creado con éxito"))
                          .show(context);
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
