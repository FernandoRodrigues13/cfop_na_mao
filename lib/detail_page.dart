// lib/detail_page.dart

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:vibration/vibration.dart'; // Importa o pacote de vibração
import 'cfop_model.dart';
import 'database_service.dart';
import 'main.dart'; // Para acessar a instância global 'isar'

class DetailPage extends StatefulWidget {
  final Cfop cfopInicial;
  const DetailPage({super.key, required this.cfopInicial});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Cfop cfop;

  @override
  void initState() {
    super.initState();
    cfop = widget.cfopInicial;
  }

  void _onToggleFavorite() async {
    // Adiciona o feedback tátil (vibração)
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 50);
    }
    
    // O resto da lógica continua o mesmo
    await DatabaseService().toggleCfopFavorite(cfop);
    final cfopDoBanco = await isar.cfops.get(cfop.id);
    if (cfopDoBanco != null && mounted) {
      setState(() {
        cfop = cfopDoBanco;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do CFOP'),
        backgroundColor: cfop.tipo == 'ENTRADA' ? Colors.green[800] : Colors.blue[800],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(cfop.isFavorite ? Icons.star : Icons.star_border, size: 28),
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
                  Text(cfop.codigo, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                  const SizedBox(height: 8),
                  Text(cfop.descricao, style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.black54)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildInfoCard(
            icon: Icons.check_circle_outline,
            iconColor: Colors.green,
            title: 'Aplicação Prática',
            content: cfop.aplicacao.isNotEmpty ? cfop.aplicacao : 'Nenhuma aplicação prática cadastrada para este CFOP.',
          ),
          const SizedBox(height: 16),
          _buildRelacionadosCard(),
          const SizedBox(height: 16),
          _buildInfoCard(
            icon: Icons.info_outline,
            iconColor: Colors.orange,
            title: 'Informações Técnicas',
            content: 'Tipo de Operação: ${cfop.tipo}',
          ),
        ],
      ),
    );
  }

  Widget _buildRelacionadosCard() {
    if (cfop.relacionados.isEmpty) return const SizedBox.shrink();
    final pares = cfop.relacionados.split(',');
    final List<Widget> chips = [];
    for (var par in pares) {
      final partes = par.split(':');
      if (partes.length == 2) {
        final tipo = partes[0].trim();
        final codigo = partes[1].trim();
        chips.add(
          ActionChip(
            avatar: const Icon(Icons.link, size: 16),
            label: Text('$tipo: $codigo'),
            onPressed: () async {
              final Cfop? cfopRelacionado = await isar.cfops.filter().codigoEqualTo(codigo).findFirst();
              if (cfopRelacionado != null && mounted) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(cfopInicial: cfopRelacionado)));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('CFOP $codigo não encontrado.')));
              }
            },
          )
        );
      }
    }
    if (chips.isEmpty) return const SizedBox.shrink();
    return _buildInfoCard(
      icon: Icons.sync_alt,
      iconColor: Colors.purple,
      title: 'CFOPs Relacionados',
      contentWidget: Wrap(spacing: 8.0, runSpacing: 4.0, children: chips),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? content,
    Widget? contentWidget,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor, size: 30),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  contentWidget ?? Text(content ?? '', style: const TextStyle(fontSize: 16, height: 1.4)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}