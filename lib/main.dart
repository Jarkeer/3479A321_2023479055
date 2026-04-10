import 'package:flutter/material.dart';
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

class MinesweeperScreen extends StatelessWidget {
  
  const MinesweeperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscaminas'), 
      ),
      body: SafeArea( 
        child: Column( 
          children: [
            // Area de Status 
            Container(
              height: 60,
              color: Colors.grey[300],
              child: const Center(
                child: Text(
                  'STATUS: 349 segundos | Minas: 10 | Cuadros: 56',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            const Divider(height: 1),
            // Área de Juego expandida 
            Expanded(
              child: _gameBoard(),
            ),
          ],
        ),
      ),
    );
  }

  // Metodo que construye el tablero 
  Widget _gameBoard() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 1.0, 
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(), 
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8, 
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: 64,  
            itemBuilder: (context, index) {
              return MineCell(index: index);
            },
          ),
        ),
      ),
    );
  }
}

// Widget atomico para cada celda 
class MineCell extends StatelessWidget {
  final int index; 

  
  const MineCell({
    super.key,
    required this.index, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400], // Color de la celda 
        border: Border.all(
          color: Colors.grey[600]!, 
          width: 1.5,
        ), 
      ),
      child: Center(
        child: Text(
          '$index',
          style: const TextStyle(fontSize: 10, color: Colors.black26),
        ),
      ),
    );
  }
}