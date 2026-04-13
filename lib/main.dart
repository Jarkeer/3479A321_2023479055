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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal,
        primary: Colors.teal,
        secondary: Colors.orange,),
        scaffoldBackgroundColor: const Color(0xFFE0F7FA),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87, fontSize: 16),
        ),
        useMaterial3: true
      ),
      home: const MinesweeperScreen(),
    );
  }
}
