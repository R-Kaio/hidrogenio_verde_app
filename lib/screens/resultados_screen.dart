import 'package:flutter/material.dart';

class ResultadosScreen extends StatelessWidget {
  const ResultadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.scaffoldBackgroundColor;
    final primaryTextColor = theme.appBarTheme.iconTheme?.color;

    return Scaffold(
      appBar: _buildAppBar(context, primaryTextColor, backgroundColor),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(
      BuildContext context, Color? primaryTextColor, Color backgroundColor) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: primaryTextColor),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Resultados',
        style: TextStyle(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.green
              : const Color(0xFFD5FFC2),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Center(
            child: Text(
              'Sem dados disponíveis',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic,
                color: theme.textTheme.bodyMedium?.color
                    ?.withValues(alpha: 127), // Substituindo withOpacity(0.5)
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(36.0),
          child: ElevatedButton(
            onPressed: () {
              // Substituir print por funcionalidade real ou log
              debugPrint('Atualizando resultados...');
            },
            style: theme.elevatedButtonTheme.style, // Usando o estilo global
            child: const Text('Atualizar'),
          ),
        ),
      ],
    );
  }
}
