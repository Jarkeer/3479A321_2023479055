import 'package:flutter/material.dart';
import 'package:flutter_app/core/servicies/storage_services.dart';
import 'package:flutter_app/ui/widgets/settings_view_model.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MODIFICADO: Observamos el ViewModel para que el nombre se actualice solo
    final settings = context.watch<SettingsViewModel>(); 

    return Scaffold(
      appBar: AppBar(title: const Text('Menu del Buscaminas')),
      body:  Center(
        child: Column(
          children: [
            Text('Pantalla de Menú, Bienvenido! ${settings.username}'), 
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
              // NUEVO: ¡Aquí está el botón que te faltaba!
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/settings'),
                child: const Text('Test ir a Ajustes'),
              ),
          ],
        ),
      ),
    );
  }
}