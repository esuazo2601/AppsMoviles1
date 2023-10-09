import 'package:flutter/material.dart';
import 'package:proyecto1/pages/Barra_Lateral.dart';

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
        body: Column(
          children: [],
        ),
        drawer: const BarraLateral(),
      ),
    );
  }
}
