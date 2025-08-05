// lib/ncm_page.dart
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'api_service.dart';
import 'ncm_model.dart';
import 'ncm_detail_page.dart';
import 'main.dart';

class NcmPage extends StatefulWidget {
  const NcmPage({super.key});
  @override
  State<NcmPage> createState() => _NcmPageState();
}

class _NcmPageState extends State<NcmPage> {
  List<Ncm> _ncmsExibidos = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = true;
  bool _mostrandoApenasFavoritos = false;

  @override
  void initState() {
    super.initState();
    _carregarDadosIniciaisNcm();
  }

  Future<void> _carregarDadosIniciaisNcm() async {
    final contagemLocal = await isar.ncms.count();
    if (contagemLocal == 0) {
      if (mounted) setState(() => _isLoading = true);
      await _sincronizarDadosEmBackground();
    }
    if (mounted) setState(() => _isLoading = false);
    _sincronizarDadosEmBackground();
  }

  Future<void> _sincronizarDadosEmBackground() async {
    try {
      final ncmsDaApi = await ApiService().fetchNcms();
      final mapaNcmsLocais = {
        for (var n in await isar.ncms.where().findAll()) n.codigo: n,
      };
      final List<Ncm> ncmsParaSalvar = [];
      bool houveMudancas = false;
      for (var ncmApi in ncmsDaApi) {
        final ncmLocal = mapaNcmsLocais[ncmApi.codigo];
        if (ncmLocal == null) {
          ncmsParaSalvar.add(ncmApi);
          houveMudancas = true;
        } else {
          if (ncmLocal.descricao != ncmApi.descricao ||
              ncmLocal.aliquota != ncmApi.aliquota) {
            final ncmAtualizado = Ncm(
              codigo: ncmApi.codigo,
              descricao: ncmApi.descricao,
              aliquota: ncmApi.aliquota,
              isFavorite: ncmLocal.isFavorite,
            )..id = ncmLocal.id;
            ncmsParaSalvar.add(ncmAtualizado);
            houveMudancas = true;
          }
        }
      }
      if (ncmsParaSalvar.isNotEmpty) {
        await isar.writeTxn(() async => await isar.ncms.putAll(ncmsParaSalvar));
        if (houveMudancas && mounted) _filtrarNcms();
      }
    } catch (e) {}
  }

  // =======================================================
  // FUNÇÃO DE FILTRO OTIMIZADA PARA BUSCAR APENAS NO CÓDIGO
  // =======================================================
  void _filtrarNcms() async {
    final termoBuscado = _searchController.text;
    if (termoBuscado.isEmpty && !_mostrandoApenasFavoritos) {
      if (mounted) setState(() => _ncmsExibidos = []);
      return;
    }
    List<Ncm> resultados =
        await isar.ncms
            .filter()
            .optional(
              _mostrandoApenasFavoritos,
              (q) => q.isFavoriteEqualTo(true),
            )
            .optional(
              termoBuscado.isNotEmpty,
              (q) => q.codigoStartsWith(termoBuscado, caseSensitive: false),
            )
            .limit(50)
            .findAll();
    if (mounted) setState(() => _ncmsExibidos = resultados);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Busca de NCM')),
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
                _filtrarNcms();
              },
              decoration: InputDecoration(
                labelText: 'Buscar por código do NCM',
                hintText: 'Ex: 0101',
                prefixIcon: const Icon(Icons.search),
                suffixIcon:
                    _searchController.text.isNotEmpty
                        ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            _filtrarNcms();
                            setState(() {});
                          },
                        )
                        : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ToggleButtons(
              isSelected: [
                !_mostrandoApenasFavoritos,
                _mostrandoApenasFavoritos,
              ],
              onPressed: (index) {
                setState(() => _mostrandoApenasFavoritos = index == 1);
                _filtrarNcms();
              },
              borderRadius: BorderRadius.circular(8.0),
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Todos'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, size: 16),
                      SizedBox(width: 8),
                      Text('Favoritos'),
                    ],
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
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text("Sincronizando +15.000 NCMs..."),
          ],
        ),
      );
    }
    if (_searchController.text.isEmpty && !_mostrandoApenasFavoritos) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'Digite um código para iniciar a busca.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
      );
    }
    if (_ncmsExibidos.isEmpty) {
      if (_mostrandoApenasFavoritos)
        return const Center(
          child: Text('Você ainda não marcou nenhum NCM como favorito.'),
        );
      return const Center(child: Text('Nenhum resultado para sua busca.'));
    }
    return ListView.builder(
      itemCount: _ncmsExibidos.length,
      itemBuilder: (context, index) {
        final ncm = _ncmsExibidos[index];
        final indent =
            ncm.descricao.startsWith('--')
                ? 32.0
                : (ncm.descricao.startsWith('-') ? 16.0 : 0.0);
        return ListTile(
          contentPadding: EdgeInsets.only(left: 16.0 + indent, right: 16.0),
          title: Text(
            ncm.codigo,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            ncm.descricao.startsWith('--')
                ? ncm.descricao.substring(2).trim()
                : (ncm.descricao.startsWith('-')
                    ? ncm.descricao.substring(1).trim()
                    : ncm.descricao.trim()),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (ncm.isFavorite)
                const Icon(Icons.star, color: Colors.amber, size: 20),
              if (ncm.isFavorite && ncm.aliquota.isNotEmpty)
                const SizedBox(width: 8),
              if (ncm.aliquota.isNotEmpty)
                Text(
                  ncm.aliquota,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
            ],
          ),
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NcmDetailPage(ncmInicial: ncm),
              ),
            );
            _filtrarNcms();
          },
        );
      },
    );
  }
}
