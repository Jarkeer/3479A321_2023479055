import 'dart:async'; // NUEVO: Necesario para usar Timer
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/cellmodel.dart';

class GameViewModel extends ChangeNotifier {
  late List<CellModel> _cells;
  bool _isGameOver = false;

  int gridSize;
  late int totalCells;
  Timer? _timer;
  int secondsElapsed = 0;
  bool _isFirstTap = true;

  List<CellModel> get cells => _cells;
  bool get isGameOver => _isGameOver;

  GameViewModel({this.gridSize = 8}) {
    totalCells = gridSize * gridSize;
    _generateBoard();
  }

  void _generateBoard() {
    _cells = List.generate(totalCells, (i) => CellModel(index: i));
    
    Random random = Random();
    int bombsPlanted = 0;
    int maxBombs = (totalCells * 0.15).toInt(); 
    
    while (bombsPlanted < maxBombs) {
      int index = random.nextInt(totalCells);
      if (!_cells[index].isBomb) {
        _cells[index].isBomb = true;
        bombsPlanted++;
      }
    }
    
    _calculateAdjacentMines();
  }

  
  void _calculateAdjacentMines() {
    for (int i = 0; i < _cells.length; i++) {
      if (_cells[i].isBomb) continue;
      
      int row = i ~/ gridSize;
      int col = i % gridSize;
      int count = 0;
      
      for (int r = -1; r <= 1; r++) {
        for (int c = -1; c <= 1; c++) {
          if (r == 0 && c == 0) continue;
          
          int newRow = row + r;
          int newCol = col + c;
          
          if (newRow >= 0 && newRow < gridSize && newCol >= 0 && newCol < gridSize) {
            int neighborIndex = (newRow * gridSize) + newCol;
            if (_cells[neighborIndex].isBomb) count++;
          }
        }
      }
      _cells[i].adjacentMines = count;
    }
  }
  
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsElapsed++;
      notifyListeners();
    });
  }

  void revealCell(int index) {
    if (_isGameOver || _cells[index].isRevealed) return;
    
    
    if (_isFirstTap) {
      _startTimer();
      _isFirstTap = false;
    }
    
    _cells[index].isRevealed = true;
    
    if (_cells[index].isBomb) {
      _isGameOver = true;
      _timer?.cancel(); 
      _revealAll();
    }
    
    notifyListeners();
  }

  void _revealAll() {
    for (var cell in _cells) {
      cell.isRevealed = true;
    }
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}