import 'package:flutter/material.dart';
import 'package:flutter_app/core/servicies/storage_services.dart';
import 'package:flutter_app/ui/screens/minesweeper_screen.dart';
import 'package:logger/logger.dart';
import 'package:flutter_app/ui/screens/about.dart';
import 'package:flutter_app/ui/screens/history_screen.dart';
import 'package:flutter_app/ui/screens/menu_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/ui/widgets/game_view_model.dart';
import 'package:flutter_app/ui/widgets/settings_view_model.dart';

var logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsViewModel()),
        ChangeNotifierProvider(create: (_) => GameViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => const MenuScreen(),
        '/game': (context) => const MinesweeperScreen(),
        '/history': (context) => const HistoryScreen(),
        '/about': (context) => const AboutScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Buscaminas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          primary: Colors.teal,
          secondary: Colors.orange,
        ),
        scaffoldBackgroundColor: const Color(0xFFE0F7FA),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87, fontSize: 16),
        ),
        useMaterial3: true,
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _nameController;
  String _selectedDifficulty = 'Fácil';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: StorageService.getUsername());
    _selectedDifficulty = StorageService.getDifficulty();
  }

  void _saveSettings() async {
    await StorageService.saveUsername(_nameController.text);
    await StorageService.saveDifficulty(_selectedDifficulty);

    if (mounted) {
      context.read<SettingsViewModel>().refreshSettings();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Guardado correctamente')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajustes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Jugador'),
            ),
            DropdownButton<String>(
              value: _selectedDifficulty,
              items: ['Fácil', 'Medio', 'Difícil']
                  .map((v) => DropdownMenuItem(value: v, child: Text(v)))
                  .toList(),
              onChanged: (v) => setState(() => _selectedDifficulty = v!),
            ),
            ElevatedButton(
              onPressed: _saveSettings,
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}