import 'package:flutter/material.dart';
import 'package:flutter_app/models/cellmodel.dart';

class MineCell extends StatelessWidget {
  final CellModel cell;
  final VoidCallback onTap; 

  const MineCell({
    Key? key,
    required this.cell,
    required this.onTap,
  }): super(key: key);

Widget _buildCellContent() {
    if (!cell.isRevealed) return const SizedBox.shrink();
    
    
    if (cell.isBomb) {
      return Image.asset(
        'assets/icons/land-mine.png', 
        width: 24, height: 24,
        errorBuilder: (c, e, s) => const Icon(Icons.dangerous, color: Colors.red),
      );
    }
    
    if (cell.adjacentMines == 0) return const SizedBox.shrink();
    
    // Paleta de colores clásica
    Color numberColor;
    switch (cell.adjacentMines) {
      case 1: numberColor = Colors.blue; break;
      case 2: numberColor = Colors.green; break;
      case 3: numberColor = Colors.red; break;
      case 4: numberColor = Colors.purple; break;
      case 5: numberColor = Colors.brown; break;
      default: numberColor = Colors.black87;
    }
    
    return Text(
      '${cell.adjacentMines}',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: numberColor),
    );
  }

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
      onTap: onTap, 
      child: Container(
        decoration: BoxDecoration(
          color: cell.isRevealed ? Colors.grey[300] : Colors.blue[200],
          border: Border.all(color: Colors.black26),
        ),
        child: Center(
          child: _buildCellContent(), 
        ),
      ),
    );
  }
}