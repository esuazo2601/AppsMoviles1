import 'package:flutter/material.dart';
import 'package:proyecto1/pages/ToDo.dart';
import 'package:proyecto1/pages/login.dart';
import 'package:proyecto1/shared/New_task.dart';
import 'package:proyecto1/shared/Task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Proyecto 1',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: TodO());
  }
}
