import 'package:flutter/material.dart';
import 'package:flutter_app/ui/screens/menu_screen.dart';
import 'package:flutter_app/ui/widgets/minecell.dart';
import 'package:flutter_app/ui/screens/about.dart';
import 'package:flutter_app/ui/screens/history_screen.dart';
class MinesweeperScreen extends StatelessWidget {
  const MinesweeperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final theme = Theme.of(context);

    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String difficulty = args?['difficulty'] ?? 'Desconocida';
    final int gridSize = args?['gridSize'] ?? 8;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscaminas'),
        
        actions: [
      
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            
            Container(
              height: 60,
              color: theme.colorScheme.primaryContainer, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Tiempo
                  Row(
                    children: [
                      Icon(Icons.timer, size: 20, color: theme.colorScheme.primary),
                      const SizedBox(width: 4),
                      const Text('349 seg'),
                    ],
                  ),
                  
                  Row(
                    children: [
                      Icon(Icons.warning_amber, size: 20, color: theme.colorScheme.primary),
                      const SizedBox(width: 4),
                      const Text('Minas: 10'),
                    ],
                  ),
                  
                  Row(
                    children: [
                      Icon(Icons.grid_on, size: 20, color: theme.colorScheme.primary),
                      const SizedBox(width: 4),
                      const Text('Cuadros: 56'),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

          
            Expanded(
              child: _gameBoard(),
            ),
            Padding(padding: const EdgeInsets.all( 8.0), child: Text('Dificultad: $difficulty | Tamaño: ${gridSize}x$gridSize',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              ),
          ],
        ),
      ),
    );
  }

  
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