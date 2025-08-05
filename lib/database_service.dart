// lib/database_service.dart
import 'cfop_model.dart';
import 'ncm_model.dart';
import 'main.dart';

class DatabaseService {
  Future<void> toggleCfopFavorite(Cfop cfop) async {
    final cfopAtualizado = Cfop(
      codigo: cfop.codigo,
      descricao: cfop.descricao,
      tipo: cfop.tipo,
      aplicacao: cfop.aplicacao,
      relacionados: cfop.relacionados,
      isFavorite: !cfop.isFavorite,
    )..id = cfop.id;
    await isar.writeTxn(() async => await isar.cfops.put(cfopAtualizado));
  }
  
  Future<void> toggleNcmFavorite(Ncm ncm) async {
    final ncmAtualizado = Ncm(
      codigo: ncm.codigo,
      descricao: ncm.descricao,
      aliquota: ncm.aliquota,
      isFavorite: !ncm.isFavorite,
    )..id = ncm.id;
    await isar.writeTxn(() async => await isar.ncms.put(ncmAtualizado));
  }
}