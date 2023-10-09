import 'package:flutter/material.dart';
import 'package:proyecto1/pages/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: const Text("Registrarse"),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
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
            ElevatedButton(onPressed: () {}, child: const Text("ACCEDER")),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Register()));
        },
        child: const Text("Registrarse"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
