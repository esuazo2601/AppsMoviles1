import 'package:flutter/material.dart';

class New_task extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Acción para "Comer"
                },
                child: Text("Comer"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Acción para "Comprar"
                },
                child: Text("Comprar"),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Acción para "Comer"
                },
                child: Text("Comer"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Acción para "Comprar"
                },
                child: Text("Comprar"),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Acción para "Guardar"
            },
            child: Text("Guardar"),
          ),
        ],
      ),
    ));
  }
}
