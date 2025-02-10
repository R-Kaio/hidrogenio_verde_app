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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                cursorColor: theme.textTheme.bodyLarge?.color,
                style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                decoration: InputDecoration(
                  hintText: 'ex: lote 001',
                  hintStyle: TextStyle(color: theme.textTheme.bodyLarge?.color),
                  filled: true,
                  fillColor: theme.inputDecorationTheme.fillColor,
                  prefixIcon: Icon(Icons.search,
                      color: theme.textTheme.bodyLarge?.color),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: theme.inputDecorationTheme.focusedBorder,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildCard(theme, 'Solicitações de Emissões:', 'EMISSÕES'),
                  const SizedBox(height: 16),
                  _buildCard(theme, 'Solicitações de Transferência:',
                      'TRANSFERÊNCIAS'),
                  const SizedBox(height: 16),
                  _buildCard(
                      theme, 'Solicitações Cancelamentos:', 'CANCELAMENTOS'),
                ],
              ),
            ),
          ],
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

  Widget _buildCard(ThemeData theme, String title, String buttonText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: theme.textTheme.bodyLarge?.color,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [], // Removed box shadow to eliminate dark outline
            ),
            alignment: Alignment.center,
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
