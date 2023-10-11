import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class Task extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final DateTime fecha_inicio;
  final DateTime fecha_fin;
  final bool? codear;
  final bool? flojear;
  final bool? comer;
  final bool? comprar;
  final VoidCallback onTaskDeleted;

  Container category(String categ) {
    Color? backgroundColor; // Color de fondo inicialmente nulo

    switch (categ) {
      case 'Codear':
        backgroundColor = Colors.orange;
        break;
      case 'Flojear':
        backgroundColor = Colors.green;
        break;
      case 'Comer':
        backgroundColor = Colors.blue;
        break;
      case 'Comprar':
        backgroundColor = Colors.grey;
        break;
    }
    return Container(
      width: 40, // Ancho del contenedor
      height: 40, // Alto del contenedor
      decoration: BoxDecoration(
        color: backgroundColor, // Color de fondo del Container
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  // Constructor que recibe los parámetros nombre, descripción y fechas
  // Agregue un identificador, se creara cada vez que se cree una Task
  Task(
      {Key? key,
      String? id,
      required this.name,
      required this.description,
      required this.fecha_inicio,
      required this.fecha_fin,
      this.codear,
      this.flojear,
      this.comer,
      this.comprar,
      required this.onTaskDeleted})
      : id = id ?? Uuid().v4(),
        super(key: key);

  Future<void> eliminarTarea(String taskId) async {
    final prefs = await SharedPreferences.getInstance();
    final tareasData = prefs.getStringList('tareas') ?? [];

    final nuevasTareasData = tareasData.where((tareaJson) {
      final tareaData = jsonDecode(tareaJson);
      final tareaId = tareaData['id'].toString();
      return tareaId != taskId;
    }).toList();
    prefs.setStringList('tareas', nuevasTareasData);
    onTaskDeleted();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'fecha_inicio': fecha_inicio.toIso8601String(),
      'fecha_fin': fecha_fin.toIso8601String(),
      'codear': codear,
      'flojear': flojear,
      'comer': comer,
      'comprar': comprar,
    };
  }

  @override
  Widget build(BuildContext context) {
    final formatoFecha = DateFormat('dd/MM/yyyy'); // Define el formato deseado
    final fechaInicioTexto = formatoFecha.format(fecha_inicio);
    final fechaFinTexto = formatoFecha.format(fecha_fin);
    final fechaTexto = '$fechaInicioTexto - $fechaFinTexto';

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(255, 192, 245, 131),
          border: Border.all(color: Colors.black, width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nombre: $name'),
                    Text('Descripción: $description'),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(fechaTexto),
                  SizedBox(height: 8),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // set up the buttons
                        Widget cancelButton = TextButton(
                          child: const Text("Cancelar"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        );
                        Widget continueButton = TextButton(
                          child: const Text("Confirmar"),
                          onPressed: () async {
                            eliminarTarea(id);
                            Navigator.pop(context);
                          },
                        );
                        // set up the AlertDialog
                        AlertDialog alert = AlertDialog(
                          title: const Text("Confirmación"),
                          content: const Text(
                              "¿Seguro que quieres borrar esta tarea?"),
                          actions: [
                            cancelButton,
                            continueButton,
                          ],
                        );
                        // show the dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                      },
                      icon: const Icon(Icons.close),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Utiliza un Expanded aquí para que la fila de categorías se ajuste al tamaño del contenedor principal
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (codear == true)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: category('Codear'),
                ),
              if (flojear == true)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: category('Flojear'),
                ),
              if (comer == true)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: category('Comer'),
                ),
              if (comprar == true)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: category('Comprar'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
