// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyecto1/pages/Barra_Lateral.dart';
import 'package:proyecto1/shared/Task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodO extends StatefulWidget {
  const TodO({super.key});

  @override
  State<TodO> createState() => _TodOState();
}

class _TodOState extends State<TodO> {
  List<Task> tasks = [];

  Future<void> cargarTareas(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final tareasData = prefs.getStringList('tareas') ?? [];

    setState(() {
      tasks = tareasData.map((tareaJson) {
        final tareaData = jsonDecode(tareaJson);
        return Task(
          id: tareaData['id'],
          name: tareaData['name'],
          description: tareaData['description'],
          fecha_inicio: DateTime.parse(tareaData['fecha_inicio']),
          fecha_fin: DateTime.parse(tareaData['fecha_fin']),
          codear: tareaData['codear'],
          flojear: tareaData['flojear'],
          comer: tareaData['comer'],
          comprar: tareaData['comprar'],
          onTaskDeleted: () async {
            cargarTareas(context);
          },
        );
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    cargarTareas(context); // Cargar las tareas al iniciar el widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("To Do List Feita"), backgroundColor: Colors.amber),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return tasks[index];
        },
      ),
      drawer: BarraLateral(cargarTareas),
    );
  }
}
