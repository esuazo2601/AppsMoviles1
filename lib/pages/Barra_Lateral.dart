import 'package:flutter/material.dart';
import 'package:proyecto1/pages/about.dart';
import 'package:proyecto1/pages/login.dart';
import 'package:proyecto1/shared/New_task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BarraLateral extends StatelessWidget {
  final Function(BuildContext) cargarTareas;

  const BarraLateral(this.cargarTareas, {super.key});

  Future<void> borrarTodo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('tareas');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("DIDO"),
            accountEmail: null,
            currentAccountPicture: Image.asset(
              'assets/capi.png',
            ),
            currentAccountPictureSize: Size(100, 100),
          ),
          ListTile(
            title: const Text("Nueva Tarea",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => New_task()))
                  .then((value) => cargarTareas(context));
            },
          ),
          ListTile(
            title: const Text("Borrar Todo",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            onTap: () {
              print("Borrando");
              borrarTodo().then((value) => cargarTareas(context));
            },
          ),
          ListTile(
            title: const Text(
              "Acerca de",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const About()));
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Salir",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
