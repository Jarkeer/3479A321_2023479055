import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu del Buscaminas')),
      body:  Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/history'),
              child: const Text('Test ir a Historial'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/about'),
              child: const Text('Test ir a Acerca de'),
             ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/game'),
                child: const Text('Test ir a Juego'),
              ),
          ],
        ),
      
      ),
      
    );
    
  }
  
}