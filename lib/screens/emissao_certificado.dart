import 'package:flutter/material.dart';

class EmissaoCertificadoScreen extends StatelessWidget {
  const EmissaoCertificadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtendo o tema atual
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final backgroundColor = theme.scaffoldBackgroundColor;
    final primaryTextColor = theme.primaryColor;
    final appBarTitleColor = theme.appBarTheme.titleTextStyle?.color;
    final appBarIconColor = appBarTitleColor;

    final secondaryTextColor =
        theme.brightness == Brightness.dark ? Colors.white : Colors.black;
    final inputBackgroundColor = theme.brightness == Brightness.dark
        ? Colors.white.withOpacity(0.1)
        : Colors.black.withOpacity(0.05);

    final focusedBorderColor = theme.colorScheme.secondary;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appBarIconColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Emissão de Certificado',
          style: textTheme.titleLarge?.copyWith(
            color: appBarTitleColor,
            fontFamily: theme.textTheme.bodyMedium?.fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    cursorColor: primaryTextColor,
                    style: TextStyle(color: secondaryTextColor),
                    decoration: InputDecoration(
                      labelText: 'Nome da Empresa',
                      labelStyle: TextStyle(color: secondaryTextColor),
                      filled: true,
                      fillColor: inputBackgroundColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: focusedBorderColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    items: [
                      DropdownMenuItem(
                        value: '1',
                        child: Text('Lote 1',
                            style: TextStyle(color: secondaryTextColor)),
                      ),
                      DropdownMenuItem(
                        value: '2',
                        child: Text('Lote 2',
                            style: TextStyle(color: secondaryTextColor)),
                      ),
                    ],
                    onChanged: (value) {},
                    style: TextStyle(color: secondaryTextColor),
                    dropdownColor: backgroundColor,
                    decoration: InputDecoration(
                      labelText: 'Lote de produção',
                      labelStyle: TextStyle(color: secondaryTextColor),
                      filled: true,
                      fillColor: inputBackgroundColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: focusedBorderColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: ElevatedButton(
                onPressed: () {
                  // Envio de solicitação
                  print('Envio de Solicitação');
                },
                style: theme.elevatedButtonTheme.style,
                child: const Text('Envio de Solicitação'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
