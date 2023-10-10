import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task extends StatelessWidget {
  final String name;
  final String description;
  final DateTime fecha_inicio;
  final DateTime fecha_fin;
  final bool? codear;
  final bool? flojear;
  final bool? comer;
  final bool? comprar;

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
  const Task({
    Key? key,
    required this.name,
    required this.description,
    required this.fecha_inicio,
    required this.fecha_fin,
    this.codear,
    this.flojear,
    this.comer,
    this.comprar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatoFecha = DateFormat('dd/MM/yyyy'); // Define el formato deseado
    final fechaInicioTexto = formatoFecha.format(fecha_inicio);
    final fechaFinTexto = formatoFecha.format(fecha_fin);
    final fechaTexto = '$fechaInicioTexto - $fechaFinTexto';

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      color: Colors.lightGreen,
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
                          onPressed: () {},
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
