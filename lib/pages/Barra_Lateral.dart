import 'package:flutter/material.dart';

class BarraLateral extends StatelessWidget {
  const BarraLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("DIDO"),
              accountEmail: null,
            ),
            ListTile(
              title: const Text("Nueva Tarea"),
              onTap: () {
                print("Agregar Tarea");
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
                print("Pushear acerca de");
              },
            )
          ],
        ),
      ),
    );
  }
}
