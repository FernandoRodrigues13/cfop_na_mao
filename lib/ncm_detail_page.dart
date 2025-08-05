// lib/ncm_detail_page.dart

import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart'; // Importa o pacote de vibração
import 'ncm_model.dart';
import 'main.dart'; // Importa para acessar 'isar'
import 'database_service.dart';

class NcmDetailPage extends StatefulWidget {
  final Ncm ncmInicial;
  const NcmDetailPage({super.key, required this.ncmInicial});

  @override
  State<NcmDetailPage> createState() => _NcmDetailPageState();
}

class _NcmDetailPageState extends State<NcmDetailPage> {
  late Ncm ncm;

  @override
  void initState() {
    super.initState();
    ncm = widget.ncmInicial;
  }

  void _onToggleFavorite() async {
    // Adiciona o feedback tátil (vibração)
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 50);
    }

    // O resto da lógica continua o mesmo
    await DatabaseService().toggleNcmFavorite(ncm);
    final ncmDoBanco = await isar.ncms.get(ncm.id);
    if (ncmDoBanco != null && mounted) {
      setState(() {
        ncm = ncmDoBanco;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do NCM'),
        actions: [
          IconButton(
            icon: Icon(ncm.isFavorite ? Icons.star : Icons.star_border, size: 28),
            onPressed: _onToggleFavorite,
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ncm.codigo, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                  const SizedBox(height: 8),
                  Text(ncm.descricao, style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.black54)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.show_chart, color: Colors.green),
              title: const Text('Alíquota IPI', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                ncm.aliquota.isNotEmpty ? '${ncm.aliquota}' : 'Não Tributado (NT) ou Alíquota Zero',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}