// ignore: file_names
import 'package:flutter/material.dart';
import 'package:proyecto1/pages/Barra_Lateral.dart';
import 'package:proyecto1/shared/Task.dart';

class TodO extends StatefulWidget {
  const TodO({super.key});

  @override
  State<TodO> createState() => _TodOState();
}

class _TodOState extends State<TodO> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
            title: const Text("To Do List Feita"),
            backgroundColor: Colors.amber),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Task(
                  name: 'Si',
                  description: 'puede ser',
                  fecha_inicio: DateTime.parse('2024-10-12'),
                  fecha_fin: DateTime.parse('2024-10-12'))
            ],
          ),
        ),
        drawer: const BarraLateral(),
      ),
    );
  }
}
