import 'package:flutter/material.dart';

class TransferenciaScreen extends StatelessWidget {
  const TransferenciaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtendo o tema atual
    final theme = Theme.of(context);

    return Scaffold(
      appBar: _buildAppBar(context, theme),
      body: _buildBody(context, theme), // Passando o context para _buildBody
    );
  }

  // AppBar
  AppBar _buildAppBar(BuildContext context, ThemeData theme) {
    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: theme.appBarTheme.iconTheme?.color),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        'TRANSFERÊNCIA',
        style: theme.appBarTheme.titleTextStyle?.copyWith(
          fontFamily: theme
              .textTheme.bodyMedium?.fontFamily, // Usando a fonte do AppTheme
        ),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  // Corpo da tela
  Widget _buildBody(BuildContext context, ThemeData theme) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, // Espaço entre os widgets
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildForm(theme),
            ),
          ),
        ),
        // Botão fixo na parte inferior
        Padding(
          padding: const EdgeInsets.all(36.0),
          child: ElevatedButton(
            onPressed: () {
              // Solicitar transferência
              debugPrint('Solicitar Transferência');
            },
            style: theme.elevatedButtonTheme.style, // Usando o estilo global
            child: const Text('Solicitar Transferência'),
          ),
        ),
      ],
    );
  }

  // Formulário
  Widget _buildForm(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel('Informações do Lote:', theme),
        const SizedBox(height: 16),
        _buildInfoText(
            'Os dados serão carregados automaticamente após a integração com a API.',
            theme),
        const SizedBox(height: 16),
        _buildLabel('Titular', theme),
        const SizedBox(height: 8),
        _buildTextField('Titular da Conta', theme),
        const SizedBox(height: 16),
        _buildLabel('Quantidade', theme),
        const SizedBox(height: 8),
        _buildDropdown(theme),
      ],
    );
  }

  // BuildLabel
  Widget _buildLabel(String text, ThemeData theme) {
    return Text(
      text,
      style: theme.textTheme.bodyMedium?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Texto informativo
  Widget _buildInfoText(String text, ThemeData theme) {
    return Text(
      text,
      style: TextStyle(
        color: theme.textTheme.bodyMedium?.color
            ?.withValues(alpha: 178), // 70% opacidade
        fontSize: 14,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  // TextField
  Widget _buildTextField(String hintText, ThemeData theme) {
    return TextField(
      cursorColor: theme.textTheme.bodyMedium?.color,
      style: TextStyle(color: theme.textTheme.bodyMedium?.color),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: theme.textTheme.bodyMedium?.color),
        filled: true,
        fillColor: theme.inputDecorationTheme.fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: theme.inputDecorationTheme.focusedBorder?.borderSide.color ??
                Colors.green,
            width: 2,
          ),
        ),
      ),
    );
  }

  // Construir o Dropdown
  Widget _buildDropdown(ThemeData theme) {
    return DropdownButtonFormField<String>(
      items: [
        _buildDropdownItem('10', '10 T', theme),
        _buildDropdownItem('20', '20 T', theme),
        _buildDropdownItem('50', '50 T', theme),
      ],
      onChanged: (value) {},
      style: TextStyle(color: theme.textTheme.bodyMedium?.color),
      dropdownColor: theme.scaffoldBackgroundColor,
      decoration: InputDecoration(
        labelText: 'Quantidade',
        labelStyle: TextStyle(color: theme.textTheme.bodyMedium?.color),
        filled: true,
        fillColor: theme.inputDecorationTheme.fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: theme.inputDecorationTheme.focusedBorder?.borderSide.color ??
                Colors.green,
            width: 2,
          ),
        ),
      ),
    );
  }

  // Dropdown
  DropdownMenuItem<String> _buildDropdownItem(
      String value, String label, ThemeData theme) {
    return DropdownMenuItem(
      value: value,
      child: Text(
        label,
        style: TextStyle(color: theme.textTheme.bodyMedium?.color),
      ),
    );
  }
}
