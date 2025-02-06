import 'package:flutter/material.dart';

class AuditorScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isLightTheme;

  const AuditorScreen({
    super.key,
    required this.onToggleTheme,
    required this.isLightTheme,
  });

  @override
  _AuditorScreenState createState() => _AuditorScreenState();
}

class _AuditorScreenState extends State<AuditorScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Auditor',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
        selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: theme.bottomNavigationBarTheme.unselectedItemColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Emissão',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Verificação',
          ),
        ],
      ),
    );
  }
}
