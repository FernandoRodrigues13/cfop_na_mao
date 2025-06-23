// lib/cfop_model.dart

import 'package:isar/isar.dart';
part 'cfop_model.g.dart'; // O build_runner precisa desta linha

@collection
class Cfop {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value, caseSensitive: false)
  final String codigo;

  @Index(type: IndexType.value, caseSensitive: false)
  final String descricao;
  
  final String tipo;
  final String aplicacao;
  final String relacionados;
  final bool isFavorite;

  Cfop({
    required this.codigo,
    required this.descricao,
    required this.tipo,
    required this.aplicacao,
    this.relacionados = '',
    this.isFavorite = false,
  });

  // Conversor manual de JSON que não depende de pacotes externos
  factory Cfop.fromJson(Map<String, dynamic> json) {
    return Cfop(
      codigo: json['codigo']?.toString() ?? '',
      descricao: json['descricao']?.toString() ?? '',
      tipo: json['tipo']?.toString() ?? '',
      aplicacao: json['aplicacao']?.toString() ?? '',
      relacionados: json['relacionados']?.toString() ?? '',
    );
  }
}