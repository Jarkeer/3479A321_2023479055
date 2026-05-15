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
    if (!cell.isRevealed) { 
      return const SizedBox.shrink(); 
    }
    if (cell.isBomb) { 
      return Image.asset( 
        'assets/icons/land-mine.png', 
        width: 40, 
        height: 40, 
        fit: BoxFit.contain, 
      );
    }
    
    return Text( 
      '${cell.index}', 
      style: const TextStyle( 
        fontWeight: FontWeight.bold, 
        color: Colors.blueGrey, 
      ),
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