// lib/ncm_model.dart
import 'package:isar/isar.dart';

part 'ncm_model.g.dart';

@collection
class Ncm {
  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value, caseSensitive: false)
  final String codigo;
  @Index(type: IndexType.value, caseSensitive: false)
  final String descricao;
  final String aliquota;
  final bool isFavorite;

  Ncm({
    required this.codigo,
    required this.descricao,
    required this.aliquota,
    this.isFavorite = false,
  });

  factory Ncm.fromJson(Map<String, dynamic> json) {
    return Ncm(
      codigo: json['codigo']?.toString() ?? '',
      descricao: json['descricao']?.toString() ?? '',
      aliquota: json['aliquota']?.toString() ?? '',
    );
  }
}