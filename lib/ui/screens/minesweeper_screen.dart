import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/minecell.dart';

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
