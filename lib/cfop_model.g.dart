// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cfop_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCfopCollection on Isar {
  IsarCollection<Cfop> get cfops => this.collection();
}

const CfopSchema = CollectionSchema(
  name: r'Cfop',
  id: -7164602399024959201,
  properties: {
    r'aplicacao': PropertySchema(
      id: 0,
      name: r'aplicacao',
      type: IsarType.string,
    ),
    r'codigo': PropertySchema(
      id: 1,
      name: r'codigo',
      type: IsarType.string,
    ),
    r'descricao': PropertySchema(
      id: 2,
      name: r'descricao',
      type: IsarType.string,
    ),
    r'isFavorite': PropertySchema(
      id: 3,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'relacionados': PropertySchema(
      id: 4,
      name: r'relacionados',
      type: IsarType.string,
    ),
    r'tipo': PropertySchema(
      id: 5,
      name: r'tipo',
      type: IsarType.string,
    )
  },
  estimateSize: _cfopEstimateSize,
  serialize: _cfopSerialize,
  deserialize: _cfopDeserialize,
  deserializeProp: _cfopDeserializeProp,
  idName: r'id',
  indexes: {
    r'codigo': IndexSchema(
      id: 2475659939796141935,
      name: r'codigo',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'codigo',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'descricao': IndexSchema(
      id: 340562283065335908,
      name: r'descricao',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'descricao',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _cfopGetId,
  getLinks: _cfopGetLinks,
  attach: _cfopAttach,
  version: '3.1.0+1',
);

int _cfopEstimateSize(
  Cfop object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.aplicacao.length * 3;
  bytesCount += 3 + object.codigo.length * 3;
  bytesCount += 3 + object.descricao.length * 3;
  bytesCount += 3 + object.relacionados.length * 3;
  bytesCount += 3 + object.tipo.length * 3;
  return bytesCount;
}

void _cfopSerialize(
  Cfop object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.aplicacao);
  writer.writeString(offsets[1], object.codigo);
  writer.writeString(offsets[2], object.descricao);
  writer.writeBool(offsets[3], object.isFavorite);
  writer.writeString(offsets[4], object.relacionados);
  writer.writeString(offsets[5], object.tipo);
}

Cfop _cfopDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Cfop(
    aplicacao: reader.readString(offsets[0]),
    codigo: reader.readString(offsets[1]),
    descricao: reader.readString(offsets[2]),
    isFavorite: reader.readBoolOrNull(offsets[3]) ?? false,
    relacionados: reader.readStringOrNull(offsets[4]) ?? '',
    tipo: reader.readString(offsets[5]),
  );
  object.id = id;
  return object;
}

P _cfopDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 4:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cfopGetId(Cfop object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cfopGetLinks(Cfop object) {
  return [];
}

void _cfopAttach(IsarCollection<dynamic> col, Id id, Cfop object) {
  object.id = id;
}

extension CfopQueryWhereSort on QueryBuilder<Cfop, Cfop, QWhere> {
  QueryBuilder<Cfop, Cfop, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhere> anyCodigo() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'codigo'),
      );
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhere> anyDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'descricao'),
      );
    });
  }
}

extension CfopQueryWhere on QueryBuilder<Cfop, Cfop, QWhereClause> {
  QueryBuilder<Cfop, Cfop, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> codigoEqualTo(String codigo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'codigo',
        value: [codigo],
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> codigoNotEqualTo(String codigo) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'codigo',
              lower: [],
              upper: [codigo],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'codigo',
              lower: [codigo],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'codigo',
              lower: [codigo],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'codigo',
              lower: [],
              upper: [codigo],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> codigoGreaterThan(
    String codigo, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'codigo',
        lower: [codigo],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> codigoLessThan(
    String codigo, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'codigo',
        lower: [],
        upper: [codigo],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> codigoBetween(
    String lowerCodigo,
    String upperCodigo, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'codigo',
        lower: [lowerCodigo],
        includeLower: includeLower,
        upper: [upperCodigo],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> codigoStartsWith(
      String CodigoPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'codigo',
        lower: [CodigoPrefix],
        upper: ['$CodigoPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> codigoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'codigo',
        value: [''],
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> codigoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'codigo',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'codigo',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'codigo',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'codigo',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> descricaoEqualTo(
      String descricao) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'descricao',
        value: [descricao],
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> descricaoNotEqualTo(
      String descricao) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'descricao',
              lower: [],
              upper: [descricao],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'descricao',
              lower: [descricao],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'descricao',
              lower: [descricao],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'descricao',
              lower: [],
              upper: [descricao],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> descricaoGreaterThan(
    String descricao, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'descricao',
        lower: [descricao],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> descricaoLessThan(
    String descricao, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'descricao',
        lower: [],
        upper: [descricao],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> descricaoBetween(
    String lowerDescricao,
    String upperDescricao, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'descricao',
        lower: [lowerDescricao],
        includeLower: includeLower,
        upper: [upperDescricao],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> descricaoStartsWith(
      String DescricaoPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'descricao',
        lower: [DescricaoPrefix],
        upper: ['$DescricaoPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> descricaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'descricao',
        value: [''],
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterWhereClause> descricaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'descricao',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'descricao',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'descricao',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'descricao',
              upper: [''],
            ));
      }
    });
  }
}

extension CfopQueryFilter on QueryBuilder<Cfop, Cfop, QFilterCondition> {
  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> aplicacaoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aplicacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> aplicacaoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aplicacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> aplicacaoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aplicacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> aplicacaoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aplicacao',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> aplicacaoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aplicacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> aplicacaoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aplicacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> aplicacaoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aplicacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> aplicacaoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aplicacao',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> aplicacaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aplicacao',
        value: '',
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> aplicacaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aplicacao',
        value: '',
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> codigoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codigo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> codigoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codigo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> codigoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codigo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> codigoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codigo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> codigoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'codigo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> codigoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'codigo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> codigoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codigo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> codigoMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codigo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> codigoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codigo',
        value: '',
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> codigoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codigo',
        value: '',
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> descricaoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> descricaoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> descricaoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> descricaoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descricao',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> descricaoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> descricaoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> descricaoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> descricaoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descricao',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> descricaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> descricaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> isFavoriteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> relacionadosEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relacionados',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> relacionadosGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'relacionados',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> relacionadosLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'relacionados',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> relacionadosBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'relacionados',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> relacionadosStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'relacionados',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> relacionadosEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'relacionados',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> relacionadosContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'relacionados',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> relacionadosMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'relacionados',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> relacionadosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relacionados',
        value: '',
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> relacionadosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'relacionados',
        value: '',
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> tipoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> tipoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> tipoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> tipoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> tipoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> tipoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> tipoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> tipoMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterFilterCondition> tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipo',
        value: '',
      ));
    });
  }
}

extension CfopQueryObject on QueryBuilder<Cfop, Cfop, QFilterCondition> {}

extension CfopQueryLinks on QueryBuilder<Cfop, Cfop, QFilterCondition> {}

extension CfopQuerySortBy on QueryBuilder<Cfop, Cfop, QSortBy> {
  QueryBuilder<Cfop, Cfop, QAfterSortBy> sortByAplicacao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aplicacao', Sort.asc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> sortByAplicacaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aplicacao', Sort.desc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> sortByCodigo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigo', Sort.asc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> sortByCodigoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigo', Sort.desc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> sortByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> sortByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> sortByRelacionados() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relacionados', Sort.asc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> sortByRelacionadosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relacionados', Sort.desc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension CfopQuerySortThenBy on QueryBuilder<Cfop, Cfop, QSortThenBy> {
  QueryBuilder<Cfop, Cfop, QAfterSortBy> thenByAplicacao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aplicacao', Sort.asc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> thenByAplicacaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aplicacao', Sort.desc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> thenByCodigo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigo', Sort.asc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> thenByCodigoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigo', Sort.desc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> thenByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> thenByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> thenByRelacionados() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relacionados', Sort.asc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> thenByRelacionadosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relacionados', Sort.desc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<Cfop, Cfop, QAfterSortBy> thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension CfopQueryWhereDistinct on QueryBuilder<Cfop, Cfop, QDistinct> {
  QueryBuilder<Cfop, Cfop, QDistinct> distinctByAplicacao(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aplicacao', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Cfop, Cfop, QDistinct> distinctByCodigo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codigo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Cfop, Cfop, QDistinct> distinctByDescricao(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descricao', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Cfop, Cfop, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<Cfop, Cfop, QDistinct> distinctByRelacionados(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'relacionados', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Cfop, Cfop, QDistinct> distinctByTipo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }
}

extension CfopQueryProperty on QueryBuilder<Cfop, Cfop, QQueryProperty> {
  QueryBuilder<Cfop, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Cfop, String, QQueryOperations> aplicacaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aplicacao');
    });
  }

  QueryBuilder<Cfop, String, QQueryOperations> codigoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codigo');
    });
  }

  QueryBuilder<Cfop, String, QQueryOperations> descricaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descricao');
    });
  }

  QueryBuilder<Cfop, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<Cfop, String, QQueryOperations> relacionadosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'relacionados');
    });
  }

  QueryBuilder<Cfop, String, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }
}
