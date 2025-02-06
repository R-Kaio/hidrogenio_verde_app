import 'package:flutter/material.dart';
import '/screens/transferencia_screen.dart';
import '/screens/cancelamento_screen.dart';
import '/screens/emissao_certificado.dart';

class CertificadosScreen extends StatefulWidget {
  final String certificateNumber;
  final String device;
  final String capacity;
  final String emissions;
  final String lotNumber;
  final String quantity;
  final String documentName;

  const CertificadosScreen({
    super.key,
    required this.certificateNumber,
    required this.device,
    required this.capacity,
    required this.emissions,
    required this.lotNumber,
    required this.quantity,
    required this.documentName,
  });

  @override
  _CertificadosScreenState createState() => _CertificadosScreenState();
}

class _CertificadosScreenState extends State<CertificadosScreen> {
  void _navigateToTransferenciaScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TransferenciaScreen()),
    );
  }

  void _navigateToCancelamentoScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CancelamentoScreen()),
    );
  }

  void _navigateToEmitirScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EmissaoCertificadoScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Certificado ${widget.certificateNumber}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Dispositivo de Produção'),
            _buildInfoRow('Dispositivo', widget.device),
            _buildInfoRow('Capacidade', widget.capacity),
            _buildInfoRow('Emissões de GEEs', widget.emissions),
            const SizedBox(height: 16.0),
            _buildSectionTitle('Lote de Produção'),
            _buildInfoRow('Número do Lote', widget.lotNumber),
            _buildInfoRow('Quantidade', widget.quantity),
            _buildInfoRow('Emissões de GEEs', widget.emissions),
            const SizedBox(height: 16.0),
            _buildSectionTitle('Documento'),
            _buildDocumentCard(context, widget.documentName),
            const Spacer(),
            // Botões na parte inferior
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _navigateToEmitirScreen,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      minimumSize: const Size(80, 40),
                    ),
                    child: const Text('Emitir'),
                  ),
                  ElevatedButton(
                    onPressed: _navigateToCancelamentoScreen,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size(80, 40),
                    ),
                    child: const Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: _navigateToTransferenciaScreen,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(80, 40),
                    ),
                    child: const Text('Transferir'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentCard(BuildContext context, String documentName) {
    return GestureDetector(
      onTap: () => print('Abrindo o documento: $documentName'),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Row(
            children: [
              const Icon(Icons.insert_drive_file, size: 24.0),
              const SizedBox(width: 8.0),
              Text(
                documentName,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
