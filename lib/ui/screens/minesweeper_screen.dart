import 'package:flutter/material.dart';
import 'package:flutter_app/models/cellmodel.dart';
import 'package:flutter_app/ui/screens/menu_screen.dart';
import 'package:flutter_app/ui/widgets/minecell.dart';
import 'package:flutter_app/ui/screens/about.dart';
import 'package:flutter_app/ui/screens/history_screen.dart';
import 'package:logger/logger.dart';

class MinesweeperScreen extends StatefulWidget {
  const MinesweeperScreen({super.key});

  @override
  State<MinesweeperScreen> createState() => _MinesweeperScreenState();
}

class _MinesweeperScreenState extends State<MinesweeperScreen> {
  late List<CellModel> _cells;
  final logger = Logger();
  
  
  @override
void initState() {
 super.initState();
 // 1. Inicializamos el estado del tablero
 _cells = List.generate(64, (i) => CellModel(index: i));
 logger.i('Lifecycle: initState() - El estado ha sido creado.');
}
@override
 void didChangeDependencies() {
 super.didChangeDependencies();
 logger.i('Lifecycle: didChangeDependencies() - Contexto listo o dependencias cambiadas.');
 }
 // 3. ACTUALIZACIÓN: Se llama cada vez que el widget padre envía nuevos parámetros.
 @override
 void didUpdateWidget(covariant MinesweeperScreen oldWidget) {
 super.didUpdateWidget(oldWidget);
 logger.w('Lifecycle: didUpdateWidget() - La configuración del widget ha cambiado.');
 }
 // 4. DESTRUCCIÓN: Se llama cuando el widget se elimina permanentemente (ej. al hacer Pop).
 @override
 void dispose() {
 logger.e('Lifecycle: dispose() - El estado se destruye. Liberando memoria.');
 super.dispose();
 }
  
  void _onCellTapped(int index) {
 setState(() {
 _cells[index].isRevealed = true; // Actualizamos el dato
 });
}

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
              return MineCell(cell: _cells[index], onTap: () {
                //logger.d('Celda $index presionada');
                _onCellTapped(index);
              });
            },
          ),
        ),
      ),
    );
  }
}