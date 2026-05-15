import 'package:flutter/material.dart';
import 'package:flutter_app/core/servicies/storage_services.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var username = StorageService.getUsername();
    return Scaffold(
      appBar: AppBar(title: const Text('Menu del Buscaminas')),
      body:  Center(
        child: Column(
          children: [
            Text('Pantalla de Menú, Bienvenido! $username'),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/history'),
              child: const Text('Test ir a Historial'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/about'),
              child: const Text('Test ir a Acerca de'),
             ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/game', arguments: {'difficulty': 'Facil', 'gridSize': 8 }),
                child: const Text('Test ir a Juego'),
              ),
          ],
        ),
      
      ),
      
    );
    
  }
  
}