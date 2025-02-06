import 'package:flutter/material.dart';
import 'home_screen.dart' as home_screen;
import 'screens/resultados_screen.dart';
import 'screens/emissao_certificado.dart';
import 'screens/transferencia_screen.dart';
import 'screens/cancelamento_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isUsingLightTheme = true;

  // Alterna entre os temas claro e escuro
  void _toggleTheme() {
    setState(() {
      _isUsingLightTheme = !_isUsingLightTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _isUsingLightTheme ? ThemeMode.light : ThemeMode.dark,
      initialRoute: Routes.home,
      routes: _buildAppRoutes(),
    );
  }

  // Define as rotas do aplicativo
  Map<String, WidgetBuilder> _buildAppRoutes() {
    return {
      Routes.home: (context) => home_screen.HomeScreen(
            isLightTheme: _isUsingLightTheme,
            onToggleTheme: _toggleTheme,
          ),
      Routes.resultados: (context) => const ResultadosScreen(),
      Routes.emissao: (context) => const EmissaoCertificadoScreen(),
      Routes.transferencia: (context) => const TransferenciaScreen(),
      Routes.cancelamento: (context) => const CancelamentoScreen(),
    };
  }
}

class Routes {
  static const String home = '/';
  static const String resultados = '/resultados';
  static const String emissao = '/emissao';
  static const String transferencia = '/transferencia';
  static const String cancelamento = '/cancelamento';
}
