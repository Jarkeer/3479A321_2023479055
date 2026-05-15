class GameResult {
  final String date;        
  final String timeSpent;   
  final bool isVictory;     
  final String difficulty;  
  final int adjacentMines;

  GameResult({
    required this.date,
    required this.timeSpent,
    required this.isVictory,
    required this.difficulty,
    required this.adjacentMines,
  });
}