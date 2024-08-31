// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notepad_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNotepadCollection on Isar {
  IsarCollection<Notepad> get notepads => this.collection();
}

const NotepadSchema = CollectionSchema(
  name: r'Notepad',
  id: 8009001663176180653,
  properties: {
    r'lastEditTime': PropertySchema(
      id: 0,
      name: r'lastEditTime',
      type: IsarType.dateTime,
    ),
    r'lastViewTime': PropertySchema(
      id: 1,
      name: r'lastViewTime',
      type: IsarType.dateTime,
    ),
    r'notepadData': PropertySchema(
      id: 2,
      name: r'notepadData',
      type: IsarType.object,
      target: r'NotepadData',
    ),
    r'notepadName': PropertySchema(
      id: 3,
      name: r'notepadName',
      type: IsarType.string,
    ),
    r'notepadType': PropertySchema(
      id: 4,
      name: r'notepadType',
      type: IsarType.long,
    )
  },
  estimateSize: _notepadEstimateSize,
  serialize: _notepadSerialize,
  deserialize: _notepadDeserialize,
  deserializeProp: _notepadDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'NotepadData': NotepadDataSchema},
  getId: _notepadGetId,
  getLinks: _notepadGetLinks,
  attach: _notepadAttach,
  version: '3.1.0+1',
);

int _notepadEstimateSize(
  Notepad object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.notepadData;
    if (value != null) {
      bytesCount += 3 +
          NotepadDataSchema.estimateSize(
              value, allOffsets[NotepadData]!, allOffsets);
    }
  }
  {
    final value = object.notepadName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _notepadSerialize(
  Notepad object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.lastEditTime);
  writer.writeDateTime(offsets[1], object.lastViewTime);
  writer.writeObject<NotepadData>(
    offsets[2],
    allOffsets,
    NotepadDataSchema.serialize,
    object.notepadData,
  );
  writer.writeString(offsets[3], object.notepadName);
  writer.writeLong(offsets[4], object.notepadType);
}

Notepad _notepadDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Notepad();
  object.id = id;
  object.lastEditTime = reader.readDateTimeOrNull(offsets[0]);
  object.lastViewTime = reader.readDateTimeOrNull(offsets[1]);
  object.notepadData = reader.readObjectOrNull<NotepadData>(
    offsets[2],
    NotepadDataSchema.deserialize,
    allOffsets,
  );
  object.notepadName = reader.readStringOrNull(offsets[3]);
  object.notepadType = reader.readLongOrNull(offsets[4]);
  return object;
}

P _notepadDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<NotepadData>(
        offset,
        NotepadDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _notepadGetId(Notepad object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _notepadGetLinks(Notepad object) {
  return [];
}

void _notepadAttach(IsarCollection<dynamic> col, Id id, Notepad object) {
  object.id = id;
}

extension NotepadQueryWhereSort on QueryBuilder<Notepad, Notepad, QWhere> {
  QueryBuilder<Notepad, Notepad, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NotepadQueryWhere on QueryBuilder<Notepad, Notepad, QWhereClause> {
  QueryBuilder<Notepad, Notepad, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Notepad, Notepad, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterWhereClause> idBetween(
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
}

extension NotepadQueryFilter
    on QueryBuilder<Notepad, Notepad, QFilterCondition> {
  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> lastEditTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastEditTime',
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition>
      lastEditTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastEditTime',
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> lastEditTimeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastEditTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> lastEditTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastEditTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> lastEditTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastEditTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> lastEditTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastEditTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> lastViewTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastViewTime',
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition>
      lastViewTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastViewTime',
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> lastViewTimeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastViewTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> lastViewTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastViewTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> lastViewTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastViewTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> lastViewTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastViewTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadData',
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadData',
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadName',
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadName',
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notepadName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notepadName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notepadName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notepadName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadName',
        value: '',
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition>
      notepadNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notepadName',
        value: '',
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadType',
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadType',
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadTypeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadType',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadTypeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadType',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadTypeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadType',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadTypeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NotepadQueryObject
    on QueryBuilder<Notepad, Notepad, QFilterCondition> {
  QueryBuilder<Notepad, Notepad, QAfterFilterCondition> notepadData(
      FilterQuery<NotepadData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'notepadData');
    });
  }
}

extension NotepadQueryLinks
    on QueryBuilder<Notepad, Notepad, QFilterCondition> {}

extension NotepadQuerySortBy on QueryBuilder<Notepad, Notepad, QSortBy> {
  QueryBuilder<Notepad, Notepad, QAfterSortBy> sortByLastEditTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastEditTime', Sort.asc);
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterSortBy> sortByLastEditTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastEditTime', Sort.desc);
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterSortBy> sortByLastViewTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastViewTime', Sort.asc);
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterSortBy> sortByLastViewTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastViewTime', Sort.desc);
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterSortBy> sortByNotepadName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadName', Sort.asc);
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterSortBy> sortByNotepadNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadName', Sort.desc);
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterSortBy> sortByNotepadType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadType', Sort.asc);
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterSortBy> sortByNotepadTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadType', Sort.desc);
    });
  }
}

extension NotepadQuerySortThenBy
    on QueryBuilder<Notepad, Notepad, QSortThenBy> {
  QueryBuilder<Notepad, Notepad, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterSortBy> thenByLastEditTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastEditTime', Sort.asc);
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterSortBy> thenByLastEditTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastEditTime', Sort.desc);
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterSortBy> thenByLastViewTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastViewTime', Sort.asc);
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterSortBy> thenByLastViewTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastViewTime', Sort.desc);
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterSortBy> thenByNotepadName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadName', Sort.asc);
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterSortBy> thenByNotepadNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadName', Sort.desc);
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterSortBy> thenByNotepadType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadType', Sort.asc);
    });
  }

  QueryBuilder<Notepad, Notepad, QAfterSortBy> thenByNotepadTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadType', Sort.desc);
    });
  }
}

extension NotepadQueryWhereDistinct
    on QueryBuilder<Notepad, Notepad, QDistinct> {
  QueryBuilder<Notepad, Notepad, QDistinct> distinctByLastEditTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastEditTime');
    });
  }

  QueryBuilder<Notepad, Notepad, QDistinct> distinctByLastViewTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastViewTime');
    });
  }

  QueryBuilder<Notepad, Notepad, QDistinct> distinctByNotepadName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notepadName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Notepad, Notepad, QDistinct> distinctByNotepadType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notepadType');
    });
  }
}

extension NotepadQueryProperty
    on QueryBuilder<Notepad, Notepad, QQueryProperty> {
  QueryBuilder<Notepad, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Notepad, DateTime?, QQueryOperations> lastEditTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastEditTime');
    });
  }

  QueryBuilder<Notepad, DateTime?, QQueryOperations> lastViewTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastViewTime');
    });
  }

  QueryBuilder<Notepad, NotepadData?, QQueryOperations> notepadDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadData');
    });
  }

  QueryBuilder<Notepad, String?, QQueryOperations> notepadNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadName');
    });
  }

  QueryBuilder<Notepad, int?, QQueryOperations> notepadTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadType');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const NotepadDataSchema = Schema(
  name: r'NotepadData',
  id: -1238907272938717929,
  properties: {},
  estimateSize: _notepadDataEstimateSize,
  serialize: _notepadDataSerialize,
  deserialize: _notepadDataDeserialize,
  deserializeProp: _notepadDataDeserializeProp,
);

int _notepadDataEstimateSize(
  NotepadData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _notepadDataSerialize(
  NotepadData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
NotepadData _notepadDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NotepadData();
  return object;
}

P _notepadDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension NotepadDataQueryFilter
    on QueryBuilder<NotepadData, NotepadData, QFilterCondition> {}

extension NotepadDataQueryObject
    on QueryBuilder<NotepadData, NotepadData, QFilterCondition> {}
