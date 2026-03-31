import 'package:flutter/material.dart';

void main() {
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
            // Área de Status 
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
            // Bloquea el scroll para que se sienta como un tablero fijo 
            physics: const NeverScrollableScrollPhysics(), 
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8, 
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: 64, // 8x8 celdas 
            itemBuilder: (context, index) {
              // Usamos el widget refactorizado 
              return MineCell(index: index);
            },
          ),
        ),
      ),
    );
  }
}

// Widget atómico para cada celda 
class MineCell extends StatelessWidget {
  final int index; // Dato inmutable 

  
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
      // Puedes agregar un número o icono aquí más adelante
      child: Center(
        child: Text(
          '$index',
          style: const TextStyle(fontSize: 10, color: Colors.black26),
        ),
      ),
    );
  }
}