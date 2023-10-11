import 'dart:ffi';

import 'package:flutter/material.dart';

class New_task extends StatefulWidget {
  @override
  State<New_task> createState() => _New_taskState();
}

class _New_taskState extends State<New_task> {
  final _fecha_inicio_controller = TextEditingController();
  final _fecha_termino_controller = TextEditingController();

  // Colores predeterminados para cada botón
  Color codearButtonColor = Colors.orange;
  Color comprarButtonColor = Colors.grey;
  Color flojearButtonColor = Colors.green;
  Color comerButtonColor = Colors.blue;

  List<bool> isSelected1 = [false, false];
  List<bool> isSelected2 = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Añadir nueva tarea"),
          backgroundColor: Colors.amber,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("Fecha inicio"),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text("Fecha termino"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ))
                  ],
                ),
                SizedBox(height: 8.0),
                Text("Nombre"),
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(height: 16.0),
                Text("Descripción"),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 110,
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                isSelected1[0]
                                    ? codearButtonColor
                                    : Colors.white)),
                        onPressed: () {
                          print("Click en codear");
                          setState(() {
                            if (isSelected1[0])
                              isSelected1[0] = false;
                            else
                              isSelected1[0] = true;
                          });
                        },
                        child: Text("Codear"),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                isSelected1[1]
                                    ? flojearButtonColor
                                    : Colors.white)),
                        onPressed: () {
                          print("Click en flojear");
                          setState(() {
                            if (isSelected1[1])
                              isSelected1[1] = false;
                            else
                              isSelected1[1] = true;
                          });
                        },
                        child: Text("Flojear"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 110,
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                isSelected2[0]
                                    ? comerButtonColor
                                    : Colors.white)),
                        onPressed: () {
                          print("Click en comer");
                          setState(() {
                            if (isSelected2[0])
                              isSelected2[0] = false;
                            else
                              isSelected2[0] = true;
                          });
                        },
                        child: Text("Comer"),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                isSelected2[1]
                                    ? comprarButtonColor
                                    : Colors.white)),
                        onPressed: () {
                          print("Click en comprar");
                          setState(() {
                            if (isSelected2[1])
                              isSelected2[1] = false;
                            else
                              isSelected2[1] = true;
                          });
                        },
                        child: Text("Comprar"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Guardar"),
                ),
              ],
            ),
          ),
        ));
  }
}
