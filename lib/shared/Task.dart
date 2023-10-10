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

  // Constructor que recibe los parámetros nombre, descripción y fechas
  const Task(
      {Key? key,
      required this.name,
      required this.description,
      required this.fecha_inicio,
      required this.fecha_fin,
      this.codear,
      this.flojear,
      this.comer,
      this.comprar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, bool> categorias = {
      'Codear': false,
      'Flojear': false,
      'Comer': false,
      'Comprar': false
    };

    final formatoFecha = DateFormat('dd/MM/yyyy'); // Define el formato deseado
    final fechaInicioTexto = formatoFecha.format(fecha_inicio);
    final fechaFinTexto = formatoFecha.format(fecha_fin);
    final fechaTexto = '$fechaInicioTexto - $fechaFinTexto';

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      color: Colors.lightGreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nombre: $name'),
              Text('Descripción: $description'),
            ],
          ),
          const SizedBox(
            width: 10, // Reducir el ancho del SizedBox
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(fechaTexto),
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber, // Color de fondo del Container
                  borderRadius: BorderRadius.circular(
                      50), // Radio de las esquinas (50 es la mitad del ancho/alto)
                ),
                child: IconButton(
                  onPressed: () {
                    print("qlo");
                  },
                  icon: const Icon(Icons.close),
                  color: Colors.white, // Color del icono
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
