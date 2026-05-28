import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/game_view_model.dart';
import 'package:flutter_app/ui/widgets/settings_view_model.dart'; 
import 'package:provider/provider.dart'; 
import 'package:logger/logger.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_app/models/cellmodel.dart';
import 'package:flutter_app/ui/widgets/minecell.dart';

class MinesweeperScreen extends StatelessWidget {
  const MinesweeperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    final gameVM = context.watch<GameViewModel>(); 
    final settingsVM = context.watch<SettingsViewModel>(); 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscaminas'),
        actions: [
          if (gameVM.isGameOver)
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                final String mensaje = '¡Acabo de jugar Buscaminas Pro!\n'
                    'Dificultad: ${settingsVM.difficulty}\n'
                    'Tiempo de supervivencia: ${gameVM.secondsElapsed} segundos.\n'
                    '¡Intenta superarme!';
                
                SharePlus.instance.share( ShareParams(text: mensaje), ); 
              },
            ),
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
                  Row(
                    children: [
                      Icon(Icons.timer, size: 20, color: theme.colorScheme.primary),
                      const SizedBox(width: 4),
                      Text('${gameVM.secondsElapsed} seg'), 
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.warning_amber, size: 20, color: theme.colorScheme.primary),
                      const SizedBox(width: 4),
                      Text('Minas: ${(gameVM.totalCells * 0.15).toInt()}'), 
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.grid_on, size: 20, color: theme.colorScheme.primary),
                      const SizedBox(width: 4),
                      Text('Cuadros: ${gameVM.totalCells}'), 
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: _gameBoard(gameVM), 
            ),
            Padding(
              padding: const EdgeInsets.all(8.0), 
              child: Text(
                'Dificultad: ${settingsVM.difficulty} | Tamaño: ${gameVM.gridSize}x${gameVM.gridSize}',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gameBoard(GameViewModel viewModel) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: viewModel.gridSize, 
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: viewModel.totalCells, 
            itemBuilder: (context, index) {

              final currentCell = viewModel.cells[index]; 
              
              return MineCell(
                cell: currentCell, 
                onTap: () {
                  viewModel.revealCell(index); 
                },
              );
            },
          ),
        ),
      ),
    );
  }
}