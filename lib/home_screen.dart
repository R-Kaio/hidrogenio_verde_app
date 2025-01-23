import 'package:flutter/material.dart';
import 'screens/resultados_screen.dart';
import 'screens/emissao_certificado.dart';
import 'screens/transferencia_screen.dart';
import 'screens/cancelamento_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isLightTheme;

  const HomeScreen({
    super.key,
    required this.onToggleTheme,
    required this.isLightTheme,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Navegar para a tela selecionada
  void _onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        _selectedIndex = index;
      });
    } else {
      _navigateToScreen(index);
    }
  }

  // Função de navegação
  void _navigateToScreen(int index) {
    final screens = [
      const ResultadosScreen(),
      const EmissaoCertificadoScreen(),
      const TransferenciaScreen(),
      const CancelamentoScreen(),
    ];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screens[index - 1],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: _buildAppBar(theme),
      body: _buildBody(theme),
      bottomNavigationBar: _buildBottomNavigationBar(theme),
    );
  }

  // AppBar
  AppBar _buildAppBar(ThemeData theme) {
    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu, color: theme.appBarTheme.iconTheme?.color),
        onPressed: () {},
      ),
      title: Text(
        'HIDROGÊNIO VERDE',
        style: TextStyle(
          color: widget.isLightTheme ? Colors.green : const Color(0xFFD5FFC2),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: [
        IconButton(
          onPressed: widget.onToggleTheme,
          icon: Icon(
            widget.isLightTheme ? Icons.dark_mode : Icons.light_mode,
            color: widget.isLightTheme
                ? Colors.green
                : const Color(0xFFD5FFC2), // Cor igual ao título
          ),
        ),
      ],
    );
  }

  // corpo da tela
  Widget _buildBody(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        cursorColor: theme.textTheme.bodyLarge?.color,
        style: TextStyle(color: theme.textTheme.bodyLarge?.color),
        decoration: InputDecoration(
          hintText: 'ex: lote 001',
          hintStyle: TextStyle(color: theme.textTheme.bodyLarge?.color),
          filled: true,
          fillColor: theme.inputDecorationTheme.fillColor,
          prefixIcon:
              Icon(Icons.search, color: theme.textTheme.bodyLarge?.color),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: theme.inputDecorationTheme.focusedBorder,
        ),
      ),
    );
  }

  // BottomNavigationBar
  BottomNavigationBar _buildBottomNavigationBar(ThemeData theme) {
    return BottomNavigationBar(
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
          icon: Icon(Icons.list),
          label: 'Resultados',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Emissão',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          label: 'Transferir',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.cancel),
          label: 'Cancelar',
        ),
      ],
    );
  }
}
