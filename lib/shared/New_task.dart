import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:proyecto1/shared/Task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class New_task extends StatefulWidget {
  @override
  State<New_task> createState() => _New_taskState();
}

class _New_taskState extends State<New_task> {
  final nombreController = TextEditingController();
  final descripcionController = TextEditingController();

  DateTime fechaInicio = DateTime.now();
  DateTime fechaFin = DateTime.now();

  // Colores predeterminados para cada botón
  Color codearButtonColor = Colors.orange;
  Color comprarButtonColor = Colors.grey;
  Color flojearButtonColor = Colors.green;
  Color comerButtonColor = Colors.blue;

  List<bool> isSelected1 = [false, false];
  List<bool> isSelected2 = [false, false];

  Future<Task> agregarTarea() async {
    final nombre = nombreController.text;
    final descripcion = descripcionController.text;
    final fechaInicio = this.fechaInicio;
    final fechaFin = this.fechaFin;
    final codear = isSelected1[0];
    final flojear = isSelected1[1];
    final comer = isSelected2[0];
    final comprar = isSelected2[1];

    // Crea una nueva tarea con los valores del formulario
    Task nuevaTarea = Task(
      name: nombre,
      description: descripcion,
      fecha_inicio: fechaInicio,
      fecha_fin: fechaFin,
      codear: codear,
      flojear: flojear,
      comer: comer,
      comprar: comprar,
      onTaskDeleted: () {},
    );

    // Convierte la tarea en un objeto JSON
    Map<String, dynamic> tareaJson = nuevaTarea.toJson();

    // Almacena la tarea JSON en SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final tareasData = prefs.getStringList('tareas') ?? [];

    tareasData.add(jsonEncode(tareaJson));

    prefs.setStringList('tareas', tareasData);

    return nuevaTarea;
  }

  bool isNombre() {
    return nombreController.text.isNotEmpty;
  }

  bool isValidDate() {
    return fechaInicio.isBefore(fechaFin);
  }

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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Fecha inicio",
                    ),
                    Text(
                      "Fecha termino",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: fechaInicio,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          ).then((selectedDate) {
                            if (selectedDate != null &&
                                selectedDate != fechaInicio) {
                              setState(() {
                                fechaInicio = selectedDate;
                              });
                            }
                          });
                        },
                        child: Text(
                          "${fechaInicio.toLocal()}".split(' ')[0],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    TextButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: fechaFin,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          ).then((selectedDate) {
                            if (selectedDate != null &&
                                selectedDate != fechaFin) {
                              setState(() {
                                fechaFin = selectedDate;
                              });
                            }
                          });
                        },
                        child: Text(
                          "${fechaFin.toLocal()}".split(' ')[0],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                SizedBox(height: 8.0),
                Text("Nombre"),
                TextField(
                  controller: nombreController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(height: 16.0),
                Text("Descripción"),
                TextField(
                  controller: descripcionController,
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
                  onPressed: () async {
                    if (!isNombre()) {
                      MotionToast.error(
                              title: const Text("Error"),
                              description: const Text(
                                  "Debe agregar un nombre a la tarea"))
                          .show(context);
                      return;
                    }
                    if (!isValidDate()) {
                      MotionToast.error(
                              title: const Text("Error"),
                              description:
                                  const Text("Ingrese una fecha valida"))
                          .show(context);
                      return;
                    }
                    agregarTarea();
                    MotionToast.success(
                            title: const Text("Éxito"),
                            description: const Text("Tarea agregada con éxito"))
                        .show(context);
                  },
                  child: Text("Guardar"),
                ),
              ],
            ),
          ),
        ));
  }
}
