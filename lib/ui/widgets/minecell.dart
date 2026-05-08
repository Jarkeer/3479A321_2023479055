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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary, 
          border: Border.all(
            color: theme.colorScheme.outline, 
            width: 1.5,
          ),
        ),
        child:  cell.isRevealed
          ? Image.asset(
              'assets/icons/land-mine.png',
              width: 30,
              height: 30,
            )
          : const SizedBox.shrink(),
          
      ),
    );
  }
}