import 'package:flutter/material.dart';
import 'package:proyecto1/pages/about.dart';
import 'package:proyecto1/shared/New_task.dart';

class BarraLateral extends StatelessWidget {
  final Function(BuildContext) cargarTareas;

  const BarraLateral(this.cargarTareas, {super.key});

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
