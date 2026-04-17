import 'package:flutter/material.dart';

class MineCell extends StatelessWidget {
  final int index;

  const MineCell({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary, // Color de la celda
        border: Border.all(
          color: theme.colorScheme.outline, // ← Sin el ?? Colors.grey
          width: 1.5,
        ),
      ),
      child: Image.asset(
        'assets/icons/land-mine.png',
        width: 30,
        height: 30,
      ),
    );
  }
}