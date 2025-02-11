import 'package:flutter/material.dart';
import 'auditor/auditor_screen.dart';
import 'screens/resultados_screen.dart';
import 'screens/emissao_certificado.dart';
import 'screens/transferencia_screen.dart';
import 'screens/cancelamento_screen.dart';
import 'screens/certificados_screen.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        _selectedIndex = index;
      });
    } else {
      _navigateToScreen(index);
    }
  }

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

  void _openSideMenu() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(theme),
      body: _buildBody(theme),
      drawer: _buildDrawer(),
      bottomNavigationBar: _buildBottomNavigationBar(theme),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'Escolha sua Tela',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Auditor'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AuditorScreen(
                    onToggleTheme: widget.onToggleTheme,
                    isLightTheme: widget.isLightTheme,
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Titular'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(ThemeData theme) {
    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu, color: theme.appBarTheme.iconTheme?.color),
        onPressed: _openSideMenu,
      ),
      title: Text(
        'HIDROGÊNIO VERDE',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: [
        IconButton(
          onPressed: widget.onToggleTheme,
          icon: Icon(
            widget.isLightTheme ? Icons.dark_mode : Icons.light_mode,
          ),
        ),
      ],
    );
  }

  Widget _buildBody(ThemeData theme) {
    return SingleChildScrollView(
      child: Padding(
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
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'CERTIFICADOS EMITIDOS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            _buildCertificateCard(
              theme,
              certificateNumber: 'YY2D',
              issueDate: '20/12/2025',
              cancelDate: '---------',
              status: 'Ativo',
              purpose: 'Consumo',
              certifyingBody: 'Emp. SIS',
            ),
            _buildCertificateCard(
              theme,
              certificateNumber: 'KXD4',
              issueDate: '20/05/2025',
              cancelDate: '---------',
              status: 'Ativo',
              purpose: 'Consumo',
              certifyingBody: 'Emp. SIS',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCertificateCard(
    ThemeData theme, {
    required String certificateNumber,
    required String issueDate,
    required String cancelDate,
    required String status,
    required String purpose,
    required String certifyingBody,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CertificadosScreen(
                certificateNumber: certificateNumber,
                device: 'Dispositivo XYZ',
                capacity: '10kW',
                emissions: '20gCO2/kWh',
                lotNumber: 'Lote 123',
                quantity: '100 unidades',
                documentName: 'Certificado.pdf'),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: theme.cardColor.withAlpha(153),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 4.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Número do Certificado: $certificateNumber'),
            Text('Data de Emissão: $issueDate'),
            Text('Data de Cancelamento: $cancelDate'),
            Text('Status do Certificado: $status'),
            Text('Finalidade da emissão: $purpose'),
            Text('Organismo de Certificação: $certifyingBody'),
          ],
        ),
      ),
    );
  }

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
