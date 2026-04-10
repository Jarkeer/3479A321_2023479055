import 'package:flutter/material.dart';

class MineCell extends StatelessWidget {
  final int index; 

  
  const MineCell({
    super.key,
    required this.index, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400], // Color de la celda 
        border: Border.all(
          color: Colors.grey[600]!, 
          width: 1.5,
        ), 
      ),
      child: Center(
        child: Text(
          '$index',
          style: const TextStyle(fontSize: 10, color: Colors.black26),
        ),
      ),
    );
  }
}