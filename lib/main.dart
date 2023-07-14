import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'BottomTabMenu.dart';

void main() {
  initializeDateFormatting('es_ES', null).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bienvenido a Silvia',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Container(
        color: Color.fromARGB(255, 255, 255, 255), // Cambia el color aquí
        child: SafeArea(
          child: BottomTabMenu(),
        ),
      ),
    );
  }
}
