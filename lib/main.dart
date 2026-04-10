import 'package:flutter/material.dart';
import 'package:flutter_app/ui/screens/minesweeper_screen.dart';
import 'package:logger/logger.dart';

var logger = Logger();

void main() {
  print(  'Iniciando la aplicación de Buscaminas'); // Print
  logger.d('Iniciando la aplicación de Buscaminas'); // Debug
  logger.i('Iniciando la aplicación de Buscaminas'); // Info
  logger.w('Iniciando la aplicación de Buscaminas'); // Warning
  logger.e('Iniciando la aplicación de Buscaminas');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buscaminas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MinesweeperScreen(),
    );
  }
}
