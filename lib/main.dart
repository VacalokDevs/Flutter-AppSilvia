import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'BottomTabMenu.dart';
import './screens/splash_screen.dart';

void main() {
  initializeDateFormatting('es_ES', null).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bienvenido a Silvia',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const SplashScreen(
        child: BottomTabMenu(),
      ),
    );
  }
}