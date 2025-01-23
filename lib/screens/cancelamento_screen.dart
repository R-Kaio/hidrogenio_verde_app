import 'package:flutter/material.dart';

class CancelamentoScreen extends StatelessWidget {
  const CancelamentoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.scaffoldBackgroundColor;
    final primaryTextColor = theme.appBarTheme.iconTheme?.color ?? Colors.black;
    final secondaryTextColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
    final inputBackgroundColor =
        theme.inputDecorationTheme.fillColor ?? Colors.white;
    final focusedBorderColor =
        theme.inputDecorationTheme.focusedBorder?.borderSide.color ??
            theme.colorScheme.secondary;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryTextColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Cancelamento',
          style: TextStyle(
            color:
                theme.appBarTheme.titleTextStyle?.color ?? theme.primaryColor,
            fontFamily: 'Roboto',
            fontSize: 20,
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
                  DropdownButtonFormField<String>(
                    items: [
                      DropdownMenuItem(
                        value: 'cert1',
                        child: Text('Certificado 1',
                            style: TextStyle(color: secondaryTextColor)),
                      ),
                      DropdownMenuItem(
                        value: 'cert2',
                        child: Text('Certificado 2',
                            style: TextStyle(color: secondaryTextColor)),
                      ),
                    ],
                    onChanged: (value) {},
                    style: TextStyle(color: secondaryTextColor),
                    dropdownColor: backgroundColor,
                    decoration: InputDecoration(
                      labelText: 'Selecionar o Certificado',
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
                  TextField(
                    keyboardType: TextInputType.number,
                    cursorColor: primaryTextColor,
                    style: TextStyle(color: secondaryTextColor),
                    decoration: InputDecoration(
                      labelText: 'Quantidade para cancelamento',
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
                  print('Solicitar Cancelamento');
                },
                style: theme.elevatedButtonTheme.style,
                child: const Text('Solicitar Cancelamento'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
