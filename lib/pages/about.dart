import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Acerca de"),
        backgroundColor: Colors.amber,
      ),
      body:
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(padding: EdgeInsets.all(10)),
        const Text("Proyecto realizado por: "),
        SizedBox(height: 20),
        const Text("- Richard Gonzalez Lara"),
        SizedBox(
          height: 20,
        ),
        const Text("- Esteban Suazo Montalba")
      ]),
    );
  }
}
