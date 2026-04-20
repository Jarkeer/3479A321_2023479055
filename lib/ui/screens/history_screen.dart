import 'package:flutter/material.dart';
import 'package:flutter_app/models/game_result.dart';
import 'package:flutter_app/ui/widgets/game_result_ui.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Resultado de prueba
    final game = GameResult(
      date: '10 Abr',
      timeSpent: '01:20',
      isVictory: true,
      difficulty: 'Fácil',
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Historial de Partidas')),
      body: Center(
        child: GameResultUI(game: game),
      ),
    );
  }
}