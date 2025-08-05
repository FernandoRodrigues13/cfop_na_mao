// lib/cfop_page.dart

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'api_service.dart';
import 'cfop_model.dart';
import 'detail_page.dart';
import 'about_page.dart';
import 'main.dart';

class CfopPage extends StatefulWidget {
  const CfopPage({super.key});
  @override
  State<CfopPage> createState() => _CfopPageState();
}

class _CfopPageState extends State<CfopPage> {
  List<Cfop> _cfopsExibidos = [];
  bool _isLoading = false;
  final TextEditingController _searchController = TextEditingController();
  bool _mostrandoApenasFavoritos = false;

  @override
  void initState() {
    super.initState();
    _sincronizarDadosEmBackground();
  }
  
  Future<void> _sincronizarDadosEmBackground() async {
    try {
      final cfopsDaApi = await ApiService().fetchCfops();
      final houveMudanca = await _sincronizarInteligente(cfopsDaApi);
      if (houveMudanca && _mostrandoApenasFavoritos && mounted) {
        _filtrarCfops();
      }
    } catch (e) {}
  }
  
  Future<bool> _sincronizarInteligente(List<Cfop> cfopsDaApi) async {
    final mapaCfopsLocais = { for (var c in await isar.cfops.where().findAll()) c.codigo : c };
    final List<Cfop> cfopsParaSalvar = [];
    bool houveMudancas = false;
    for (var cfopApi in cfopsDaApi) {
      final cfopLocal = mapaCfopsLocais[cfopApi.codigo];
      if (cfopLocal == null) {
        cfopsParaSalvar.add(cfopApi);
        houveMudancas = true;
      } else {
        if (cfopLocal.descricao != cfopApi.descricao || cfopLocal.aplicacao != cfopApi.aplicacao || cfopLocal.relacionados != cfopApi.relacionados) {
          final cfopAtualizado = Cfop(codigo: cfopApi.codigo, descricao: cfopApi.descricao, tipo: cfopApi.tipo, aplicacao: cfopApi.aplicacao, relacionados: cfopApi.relacionados, isFavorite: cfopLocal.isFavorite)..id = cfopLocal.id;
          cfopsParaSalvar.add(cfopAtualizado);
          houveMudancas = true;
        }
      }
    }
    if (cfopsParaSalvar.isNotEmpty) {
      await isar.writeTxn(() async => await isar.cfops.putAll(cfopsParaSalvar));
    }
    return houveMudancas;
  }

  // =======================================================
  // FUNÇÃO DE FILTRO OTIMIZADA PARA BUSCAR APENAS NO CÓDIGO
  // =======================================================
  void _filtrarCfops() async {
    final termoBuscado = _searchController.text;
    if (termoBuscado.isEmpty && !_mostrandoApenasFavoritos) {
      if (mounted) setState(() => _cfopsExibidos = []);
      return;
    }
    List<Cfop> resultados = await isar.cfops.filter()
      .optional(_mostrandoApenasFavoritos, (q) => q.isFavoriteEqualTo(true))
      .optional(
        termoBuscado.isNotEmpty,
        (q) => q.codigoContains(termoBuscado, caseSensitive: false)
      )
      .findAll();
    if (mounted) setState(() => _cfopsExibidos = resultados);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca de CFOP'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Sobre o App',
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage())),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: TextField(
              controller: _searchController,
              autofocus: true,
              keyboardType: TextInputType.number, // TECLADO NUMÉRICO
              onChanged: (text) {
                setState(() {});
                _filtrarCfops();
              },
              decoration: InputDecoration(
                labelText: 'Buscar por código',
                hintText: 'Ex: 5102',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _filtrarCfops();
                          setState(() {});
                        },
                      )
                    : null,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ToggleButtons(
              isSelected: [!_mostrandoApenasFavoritos, _mostrandoApenasFavoritos],
              onPressed: (index) {
                setState(() => _mostrandoApenasFavoritos = index == 1);
                _filtrarCfops();
              },
              borderRadius: BorderRadius.circular(8.0),
              children: const [
                Padding(padding: EdgeInsets.symmetric(horizontal: 16.0), child: Text('Todos')),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.star, size: 16), SizedBox(width: 8), Text('Favoritos')],
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) return const Center(child: CircularProgressIndicator());
    if (_cfopsExibidos.isEmpty) {
      if (_mostrandoApenasFavoritos) return const Center(child: Text('Você ainda não marcou nenhum CFOP como favorito.'));
      if (_searchController.text.isNotEmpty) return const Center(child: Text('Nenhum resultado para sua busca.'));
      return const Center(child: Padding(padding: EdgeInsets.all(24.0), child: Text('Digite um código para iniciar a busca.', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.grey))));
    }
    return ListView.builder(
      itemCount: _cfopsExibidos.length,
      itemBuilder: (context, index) {
        final cfop = _cfopsExibidos[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: cfop.tipo == 'ENTRADA' ? Colors.green[700] : Colors.blue[700],
            child: Text(cfop.tipo == 'ENTRADA' ? 'E' : 'S', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          trailing: cfop.isFavorite ? const Icon(Icons.star, color: Colors.amber) : null,
          title: Text(cfop.codigo, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(cfop.descricao),
          onTap: () async {
            await Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(cfopInicial: cfop)));
            _filtrarCfops();
          },
        );
      },
    );
  }
}