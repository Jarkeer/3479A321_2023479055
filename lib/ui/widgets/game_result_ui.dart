import 'package:flutter/material.dart';
import 'package:flutter_app/models/game_result.dart';

class GameResultUI extends StatelessWidget {
  final GameResult game;

  const GameResultUI({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ✅ Solo retornamos la Card, sin Scaffold ni AppBar
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Fecha: ${game.date}'),
            Text('Tiempo: ${game.timeSpent}'),
          ],
        ),
      ),
    );
  }
}