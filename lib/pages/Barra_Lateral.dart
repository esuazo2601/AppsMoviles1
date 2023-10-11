import 'package:flutter/material.dart';
import 'package:proyecto1/pages/about.dart';
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
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
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
              title: const Text("Nueva Tarea"),
              onTap: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => New_task()))
                    .then((value) => cargarTareas(context));
              },
            ),
            ListTile(
              title: const Text("Borrar Todo"),
              onTap: () {
                print("Borrando");
                borrarTodo().then((value) => cargarTareas(context));
              },
            ),
            ListTile(
              title: const Text("Acerca de"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const About()));
              },
            )
          ],
        ),
      ),
    );
  }
}
