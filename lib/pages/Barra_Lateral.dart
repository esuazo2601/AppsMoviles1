import 'package:flutter/material.dart';
import 'package:proyecto1/pages/about.dart';

class BarraLateral extends StatelessWidget {
  BarraLateral({super.key});
  final _fecha_iniciocontroller = TextEditingController();
  final _fecha_fincontroller = TextEditingController();

  _mostrarDialogNuevaTarea(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Agregar nueva tarea"),
            content: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      const Text("Fecha Inicio"),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text("Fecha Fin"),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _fecha_iniciocontroller,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextFormField(
                        controller: _fecha_fincontroller,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
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
                _mostrarDialogNuevaTarea(context);
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
