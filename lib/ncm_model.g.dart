// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ncm_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNcmCollection on Isar {
  IsarCollection<Ncm> get ncms => this.collection();
}

const NcmSchema = CollectionSchema(
  name: r'Ncm',
  id: -6373093603472316079,
  properties: {
    r'aliquota': PropertySchema(
      id: 0,
      name: r'aliquota',
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
    )
  },
  estimateSize: _ncmEstimateSize,
  serialize: _ncmSerialize,
  deserialize: _ncmDeserialize,
  deserializeProp: _ncmDeserializeProp,
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
  getId: _ncmGetId,
  getLinks: _ncmGetLinks,
  attach: _ncmAttach,
  version: '3.1.0+1',
);

int _ncmEstimateSize(
  Ncm object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.aliquota.length * 3;
  bytesCount += 3 + object.codigo.length * 3;
  bytesCount += 3 + object.descricao.length * 3;
  return bytesCount;
}

void _ncmSerialize(
  Ncm object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.aliquota);
  writer.writeString(offsets[1], object.codigo);
  writer.writeString(offsets[2], object.descricao);
  writer.writeBool(offsets[3], object.isFavorite);
}

Ncm _ncmDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Ncm(
    aliquota: reader.readString(offsets[0]),
    codigo: reader.readString(offsets[1]),
    descricao: reader.readString(offsets[2]),
    isFavorite: reader.readBoolOrNull(offsets[3]) ?? false,
  );
  object.id = id;
  return object;
}

P _ncmDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ncmGetId(Ncm object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ncmGetLinks(Ncm object) {
  return [];
}

void _ncmAttach(IsarCollection<dynamic> col, Id id, Ncm object) {
  object.id = id;
}

extension NcmQueryWhereSort on QueryBuilder<Ncm, Ncm, QWhere> {
  QueryBuilder<Ncm, Ncm, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterWhere> anyCodigo() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'codigo'),
      );
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterWhere> anyDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'descricao'),
      );
    });
  }
}

extension NcmQueryWhere on QueryBuilder<Ncm, Ncm, QWhereClause> {
  QueryBuilder<Ncm, Ncm, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> idBetween(
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

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> codigoEqualTo(String codigo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'codigo',
        value: [codigo],
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> codigoNotEqualTo(String codigo) {
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

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> codigoGreaterThan(
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

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> codigoLessThan(
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

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> codigoBetween(
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

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> codigoStartsWith(
      String CodigoPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'codigo',
        lower: [CodigoPrefix],
        upper: ['$CodigoPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> codigoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'codigo',
        value: [''],
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> codigoIsNotEmpty() {
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

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> descricaoEqualTo(String descricao) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'descricao',
        value: [descricao],
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> descricaoNotEqualTo(
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

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> descricaoGreaterThan(
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

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> descricaoLessThan(
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

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> descricaoBetween(
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

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> descricaoStartsWith(
      String DescricaoPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'descricao',
        lower: [DescricaoPrefix],
        upper: ['$DescricaoPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> descricaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'descricao',
        value: [''],
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterWhereClause> descricaoIsNotEmpty() {
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

extension NcmQueryFilter on QueryBuilder<Ncm, Ncm, QFilterCondition> {
  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> aliquotaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aliquota',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> aliquotaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aliquota',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> aliquotaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aliquota',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> aliquotaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aliquota',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> aliquotaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aliquota',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> aliquotaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aliquota',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> aliquotaContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aliquota',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> aliquotaMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aliquota',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> aliquotaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aliquota',
        value: '',
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> aliquotaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aliquota',
        value: '',
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> codigoEqualTo(
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

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> codigoGreaterThan(
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

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> codigoLessThan(
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

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> codigoBetween(
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

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> codigoStartsWith(
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

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> codigoEndsWith(
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

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> codigoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codigo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> codigoMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codigo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> codigoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codigo',
        value: '',
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> codigoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codigo',
        value: '',
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> descricaoEqualTo(
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

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> descricaoGreaterThan(
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

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> descricaoLessThan(
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

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> descricaoBetween(
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

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> descricaoStartsWith(
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

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> descricaoEndsWith(
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

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> descricaoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> descricaoMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descricao',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> descricaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> descricaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Ncm, Ncm, QAfterFilterCondition> isFavoriteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }
}

extension NcmQueryObject on QueryBuilder<Ncm, Ncm, QFilterCondition> {}

extension NcmQueryLinks on QueryBuilder<Ncm, Ncm, QFilterCondition> {}

extension NcmQuerySortBy on QueryBuilder<Ncm, Ncm, QSortBy> {
  QueryBuilder<Ncm, Ncm, QAfterSortBy> sortByAliquota() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aliquota', Sort.asc);
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterSortBy> sortByAliquotaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aliquota', Sort.desc);
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterSortBy> sortByCodigo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigo', Sort.asc);
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterSortBy> sortByCodigoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigo', Sort.desc);
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterSortBy> sortByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterSortBy> sortByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterSortBy> sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }
}

extension NcmQuerySortThenBy on QueryBuilder<Ncm, Ncm, QSortThenBy> {
  QueryBuilder<Ncm, Ncm, QAfterSortBy> thenByAliquota() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aliquota', Sort.asc);
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterSortBy> thenByAliquotaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aliquota', Sort.desc);
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterSortBy> thenByCodigo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigo', Sort.asc);
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterSortBy> thenByCodigoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigo', Sort.desc);
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterSortBy> thenByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterSortBy> thenByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Ncm, Ncm, QAfterSortBy> thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }
}

extension NcmQueryWhereDistinct on QueryBuilder<Ncm, Ncm, QDistinct> {
  QueryBuilder<Ncm, Ncm, QDistinct> distinctByAliquota(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aliquota', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Ncm, Ncm, QDistinct> distinctByCodigo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codigo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Ncm, Ncm, QDistinct> distinctByDescricao(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descricao', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Ncm, Ncm, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }
}

extension NcmQueryProperty on QueryBuilder<Ncm, Ncm, QQueryProperty> {
  QueryBuilder<Ncm, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Ncm, String, QQueryOperations> aliquotaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aliquota');
    });
  }

  QueryBuilder<Ncm, String, QQueryOperations> codigoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codigo');
    });
  }

  QueryBuilder<Ncm, String, QQueryOperations> descricaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descricao');
    });
  }

  QueryBuilder<Ncm, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }
}
