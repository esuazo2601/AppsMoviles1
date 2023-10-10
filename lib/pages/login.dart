import 'package:flutter/material.dart';
import 'package:proyecto1/pages/ToDo.dart';
import 'package:proyecto1/pages/register.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<bool> userExist() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('username');
    final password = prefs.getString('password');
    if (user == null || password == null) return false;
    if (user == _userController.text && password == _passwordController.text) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (!await userExist()) {
                        MotionToast.error(
                                title: const Text("Error"),
                                description: const Text(
                                    "Usuario o contraseña incorrectos"))
                            .show(context);
                        return;
                      }
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TodO()));
                    },
                    child: const Text("ACCEDER")),
                const SizedBox(
                  height: 180,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()));
                  },
                  child: const Text("Registrarse"),
                ),
              ],
            ),
          ),
        ));
  }
}
