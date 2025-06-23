// lib/database_service.dart

import 'package:cfop_na_mao/cfop_model.dart';
import 'package:cfop_na_mao/main.dart'; // Para acessar a instância global 'isar'

class DatabaseService {
  Future<void> toggleFavorite(Cfop cfop) async {
    // Cria uma cópia do objeto com o valor de 'isFavorite' invertido.
    final cfopAtualizado = Cfop(
      codigo: cfop.codigo,
      descricao: cfop.descricao,
      tipo: cfop.tipo,
      aplicacao: cfop.aplicacao,
      relacionados: cfop.relacionados,
      isFavorite: !cfop.isFavorite, // A lógica de inversão
    );
    // Mantém o mesmo ID para que o Isar saiba qual registro deve ser ATUALIZADO.
    cfopAtualizado.id = cfop.id;

    // Abre uma transação de escrita e salva o objeto atualizado.
    await isar.writeTxn(() async {
      await isar.cfops.put(cfopAtualizado);
    });
  }
}