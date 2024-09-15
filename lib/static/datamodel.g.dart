// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datamodel.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNotepadsCollection on Isar {
  IsarCollection<Notepads> get notepads => this.collection();
}

const NotepadsSchema = CollectionSchema(
  name: r'Notepads',
  id: 4949384102592270085,
  properties: {
    r'notepadsCreateTime': PropertySchema(
      id: 0,
      name: r'notepadsCreateTime',
      type: IsarType.dateTime,
    ),
    r'notepadsName': PropertySchema(
      id: 1,
      name: r'notepadsName',
      type: IsarType.string,
    ),
    r'notepadsViewTime': PropertySchema(
      id: 2,
      name: r'notepadsViewTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _notepadsEstimateSize,
  serialize: _notepadsSerialize,
  deserialize: _notepadsDeserialize,
  deserializeProp: _notepadsDeserializeProp,
  idName: r'notepadsID',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _notepadsGetId,
  getLinks: _notepadsGetLinks,
  attach: _notepadsAttach,
  version: '3.1.0+1',
);

int _notepadsEstimateSize(
  Notepads object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.notepadsName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _notepadsSerialize(
  Notepads object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.notepadsCreateTime);
  writer.writeString(offsets[1], object.notepadsName);
  writer.writeDateTime(offsets[2], object.notepadsViewTime);
}

Notepads _notepadsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Notepads();
  object.notepadsCreateTime = reader.readDateTimeOrNull(offsets[0]);
  object.notepadsID = id;
  object.notepadsName = reader.readStringOrNull(offsets[1]);
  object.notepadsViewTime = reader.readDateTimeOrNull(offsets[2]);
  return object;
}

P _notepadsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _notepadsGetId(Notepads object) {
  return object.notepadsID ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _notepadsGetLinks(Notepads object) {
  return [];
}

void _notepadsAttach(IsarCollection<dynamic> col, Id id, Notepads object) {
  object.notepadsID = id;
}

extension NotepadsQueryWhereSort on QueryBuilder<Notepads, Notepads, QWhere> {
  QueryBuilder<Notepads, Notepads, QAfterWhere> anyNotepadsID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NotepadsQueryWhere on QueryBuilder<Notepads, Notepads, QWhereClause> {
  QueryBuilder<Notepads, Notepads, QAfterWhereClause> notepadsIDEqualTo(
      Id notepadsID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: notepadsID,
        upper: notepadsID,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterWhereClause> notepadsIDNotEqualTo(
      Id notepadsID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: notepadsID, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: notepadsID, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: notepadsID, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: notepadsID, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterWhereClause> notepadsIDGreaterThan(
      Id notepadsID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: notepadsID, includeLower: include),
      );
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterWhereClause> notepadsIDLessThan(
      Id notepadsID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: notepadsID, includeUpper: include),
      );
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterWhereClause> notepadsIDBetween(
    Id lowerNotepadsID,
    Id upperNotepadsID, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerNotepadsID,
        includeLower: includeLower,
        upper: upperNotepadsID,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NotepadsQueryFilter
    on QueryBuilder<Notepads, Notepads, QFilterCondition> {
  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsCreateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadsCreateTime',
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsCreateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadsCreateTime',
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsCreateTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadsCreateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsCreateTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadsCreateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsCreateTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadsCreateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsCreateTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadsCreateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition> notepadsIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadsID',
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadsID',
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition> notepadsIDEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadsID',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition> notepadsIDGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadsID',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition> notepadsIDLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadsID',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition> notepadsIDBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadsID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition> notepadsNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadsName',
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadsName',
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition> notepadsNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition> notepadsNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition> notepadsNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadsName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notepadsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition> notepadsNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notepadsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition> notepadsNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notepadsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition> notepadsNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notepadsName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadsName',
        value: '',
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notepadsName',
        value: '',
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsViewTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadsViewTime',
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsViewTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadsViewTime',
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsViewTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadsViewTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsViewTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadsViewTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsViewTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadsViewTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterFilterCondition>
      notepadsViewTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadsViewTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NotepadsQueryObject
    on QueryBuilder<Notepads, Notepads, QFilterCondition> {}

extension NotepadsQueryLinks
    on QueryBuilder<Notepads, Notepads, QFilterCondition> {}

extension NotepadsQuerySortBy on QueryBuilder<Notepads, Notepads, QSortBy> {
  QueryBuilder<Notepads, Notepads, QAfterSortBy> sortByNotepadsCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsCreateTime', Sort.asc);
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterSortBy>
      sortByNotepadsCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsCreateTime', Sort.desc);
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterSortBy> sortByNotepadsName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsName', Sort.asc);
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterSortBy> sortByNotepadsNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsName', Sort.desc);
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterSortBy> sortByNotepadsViewTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsViewTime', Sort.asc);
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterSortBy> sortByNotepadsViewTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsViewTime', Sort.desc);
    });
  }
}

extension NotepadsQuerySortThenBy
    on QueryBuilder<Notepads, Notepads, QSortThenBy> {
  QueryBuilder<Notepads, Notepads, QAfterSortBy> thenByNotepadsCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsCreateTime', Sort.asc);
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterSortBy>
      thenByNotepadsCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsCreateTime', Sort.desc);
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterSortBy> thenByNotepadsID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsID', Sort.asc);
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterSortBy> thenByNotepadsIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsID', Sort.desc);
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterSortBy> thenByNotepadsName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsName', Sort.asc);
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterSortBy> thenByNotepadsNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsName', Sort.desc);
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterSortBy> thenByNotepadsViewTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsViewTime', Sort.asc);
    });
  }

  QueryBuilder<Notepads, Notepads, QAfterSortBy> thenByNotepadsViewTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsViewTime', Sort.desc);
    });
  }
}

extension NotepadsQueryWhereDistinct
    on QueryBuilder<Notepads, Notepads, QDistinct> {
  QueryBuilder<Notepads, Notepads, QDistinct> distinctByNotepadsCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notepadsCreateTime');
    });
  }

  QueryBuilder<Notepads, Notepads, QDistinct> distinctByNotepadsName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notepadsName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Notepads, Notepads, QDistinct> distinctByNotepadsViewTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notepadsViewTime');
    });
  }
}

extension NotepadsQueryProperty
    on QueryBuilder<Notepads, Notepads, QQueryProperty> {
  QueryBuilder<Notepads, int, QQueryOperations> notepadsIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadsID');
    });
  }

  QueryBuilder<Notepads, DateTime?, QQueryOperations>
      notepadsCreateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadsCreateTime');
    });
  }

  QueryBuilder<Notepads, String?, QQueryOperations> notepadsNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadsName');
    });
  }

  QueryBuilder<Notepads, DateTime?, QQueryOperations>
      notepadsViewTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadsViewTime');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNotepadsChildCollection on Isar {
  IsarCollection<NotepadsChild> get notepadsChilds => this.collection();
}

const NotepadsChildSchema = CollectionSchema(
  name: r'NotepadsChild',
  id: 5473324212582293026,
  properties: {
    r'notepadsChildName': PropertySchema(
      id: 0,
      name: r'notepadsChildName',
      type: IsarType.string,
    ),
    r'notepadsCreateTime': PropertySchema(
      id: 1,
      name: r'notepadsCreateTime',
      type: IsarType.dateTime,
    ),
    r'notepadsID': PropertySchema(
      id: 2,
      name: r'notepadsID',
      type: IsarType.long,
    ),
    r'notepadsParentID': PropertySchema(
      id: 3,
      name: r'notepadsParentID',
      type: IsarType.long,
    ),
    r'notepadsViewTime': PropertySchema(
      id: 4,
      name: r'notepadsViewTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _notepadsChildEstimateSize,
  serialize: _notepadsChildSerialize,
  deserialize: _notepadsChildDeserialize,
  deserializeProp: _notepadsChildDeserializeProp,
  idName: r'notepadsChildID',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _notepadsChildGetId,
  getLinks: _notepadsChildGetLinks,
  attach: _notepadsChildAttach,
  version: '3.1.0+1',
);

int _notepadsChildEstimateSize(
  NotepadsChild object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.notepadsChildName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _notepadsChildSerialize(
  NotepadsChild object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.notepadsChildName);
  writer.writeDateTime(offsets[1], object.notepadsCreateTime);
  writer.writeLong(offsets[2], object.notepadsID);
  writer.writeLong(offsets[3], object.notepadsParentID);
  writer.writeDateTime(offsets[4], object.notepadsViewTime);
}

NotepadsChild _notepadsChildDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NotepadsChild();
  object.notepadsChildID = id;
  object.notepadsChildName = reader.readStringOrNull(offsets[0]);
  object.notepadsCreateTime = reader.readDateTimeOrNull(offsets[1]);
  object.notepadsID = reader.readLongOrNull(offsets[2]);
  object.notepadsParentID = reader.readLongOrNull(offsets[3]);
  object.notepadsViewTime = reader.readDateTimeOrNull(offsets[4]);
  return object;
}

P _notepadsChildDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _notepadsChildGetId(NotepadsChild object) {
  return object.notepadsChildID ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _notepadsChildGetLinks(NotepadsChild object) {
  return [];
}

void _notepadsChildAttach(
    IsarCollection<dynamic> col, Id id, NotepadsChild object) {
  object.notepadsChildID = id;
}

extension NotepadsChildQueryWhereSort
    on QueryBuilder<NotepadsChild, NotepadsChild, QWhere> {
  QueryBuilder<NotepadsChild, NotepadsChild, QAfterWhere> anyNotepadsChildID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NotepadsChildQueryWhere
    on QueryBuilder<NotepadsChild, NotepadsChild, QWhereClause> {
  QueryBuilder<NotepadsChild, NotepadsChild, QAfterWhereClause>
      notepadsChildIDEqualTo(Id notepadsChildID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: notepadsChildID,
        upper: notepadsChildID,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterWhereClause>
      notepadsChildIDNotEqualTo(Id notepadsChildID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(
                  upper: notepadsChildID, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(
                  lower: notepadsChildID, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(
                  lower: notepadsChildID, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(
                  upper: notepadsChildID, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterWhereClause>
      notepadsChildIDGreaterThan(Id notepadsChildID, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(
            lower: notepadsChildID, includeLower: include),
      );
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterWhereClause>
      notepadsChildIDLessThan(Id notepadsChildID, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: notepadsChildID, includeUpper: include),
      );
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterWhereClause>
      notepadsChildIDBetween(
    Id lowerNotepadsChildID,
    Id upperNotepadsChildID, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerNotepadsChildID,
        includeLower: includeLower,
        upper: upperNotepadsChildID,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NotepadsChildQueryFilter
    on QueryBuilder<NotepadsChild, NotepadsChild, QFilterCondition> {
  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadsChildID',
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadsChildID',
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildIDEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadsChildID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildIDGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadsChildID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildIDLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadsChildID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildIDBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadsChildID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadsChildName',
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadsChildName',
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadsChildName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadsChildName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadsChildName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadsChildName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notepadsChildName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notepadsChildName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notepadsChildName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notepadsChildName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadsChildName',
        value: '',
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsChildNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notepadsChildName',
        value: '',
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsCreateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadsCreateTime',
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsCreateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadsCreateTime',
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsCreateTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadsCreateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsCreateTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadsCreateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsCreateTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadsCreateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsCreateTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadsCreateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadsID',
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadsID',
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsIDEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadsID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsIDGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadsID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsIDLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadsID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsIDBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadsID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsParentIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadsParentID',
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsParentIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadsParentID',
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsParentIDEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadsParentID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsParentIDGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadsParentID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsParentIDLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadsParentID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsParentIDBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadsParentID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsViewTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadsViewTime',
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsViewTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadsViewTime',
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsViewTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadsViewTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsViewTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadsViewTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsViewTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadsViewTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterFilterCondition>
      notepadsViewTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadsViewTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NotepadsChildQueryObject
    on QueryBuilder<NotepadsChild, NotepadsChild, QFilterCondition> {}

extension NotepadsChildQueryLinks
    on QueryBuilder<NotepadsChild, NotepadsChild, QFilterCondition> {}

extension NotepadsChildQuerySortBy
    on QueryBuilder<NotepadsChild, NotepadsChild, QSortBy> {
  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      sortByNotepadsChildName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsChildName', Sort.asc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      sortByNotepadsChildNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsChildName', Sort.desc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      sortByNotepadsCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsCreateTime', Sort.asc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      sortByNotepadsCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsCreateTime', Sort.desc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy> sortByNotepadsID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsID', Sort.asc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      sortByNotepadsIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsID', Sort.desc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      sortByNotepadsParentID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsParentID', Sort.asc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      sortByNotepadsParentIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsParentID', Sort.desc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      sortByNotepadsViewTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsViewTime', Sort.asc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      sortByNotepadsViewTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsViewTime', Sort.desc);
    });
  }
}

extension NotepadsChildQuerySortThenBy
    on QueryBuilder<NotepadsChild, NotepadsChild, QSortThenBy> {
  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      thenByNotepadsChildID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsChildID', Sort.asc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      thenByNotepadsChildIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsChildID', Sort.desc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      thenByNotepadsChildName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsChildName', Sort.asc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      thenByNotepadsChildNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsChildName', Sort.desc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      thenByNotepadsCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsCreateTime', Sort.asc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      thenByNotepadsCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsCreateTime', Sort.desc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy> thenByNotepadsID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsID', Sort.asc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      thenByNotepadsIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsID', Sort.desc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      thenByNotepadsParentID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsParentID', Sort.asc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      thenByNotepadsParentIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsParentID', Sort.desc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      thenByNotepadsViewTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsViewTime', Sort.asc);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QAfterSortBy>
      thenByNotepadsViewTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsViewTime', Sort.desc);
    });
  }
}

extension NotepadsChildQueryWhereDistinct
    on QueryBuilder<NotepadsChild, NotepadsChild, QDistinct> {
  QueryBuilder<NotepadsChild, NotepadsChild, QDistinct>
      distinctByNotepadsChildName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notepadsChildName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QDistinct>
      distinctByNotepadsCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notepadsCreateTime');
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QDistinct> distinctByNotepadsID() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notepadsID');
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QDistinct>
      distinctByNotepadsParentID() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notepadsParentID');
    });
  }

  QueryBuilder<NotepadsChild, NotepadsChild, QDistinct>
      distinctByNotepadsViewTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notepadsViewTime');
    });
  }
}

extension NotepadsChildQueryProperty
    on QueryBuilder<NotepadsChild, NotepadsChild, QQueryProperty> {
  QueryBuilder<NotepadsChild, int, QQueryOperations> notepadsChildIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadsChildID');
    });
  }

  QueryBuilder<NotepadsChild, String?, QQueryOperations>
      notepadsChildNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadsChildName');
    });
  }

  QueryBuilder<NotepadsChild, DateTime?, QQueryOperations>
      notepadsCreateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadsCreateTime');
    });
  }

  QueryBuilder<NotepadsChild, int?, QQueryOperations> notepadsIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadsID');
    });
  }

  QueryBuilder<NotepadsChild, int?, QQueryOperations>
      notepadsParentIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadsParentID');
    });
  }

  QueryBuilder<NotepadsChild, DateTime?, QQueryOperations>
      notepadsViewTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadsViewTime');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNotepadFileCollection on Isar {
  IsarCollection<NotepadFile> get notepadFiles => this.collection();
}

const NotepadFileSchema = CollectionSchema(
  name: r'NotepadFile',
  id: -4731148752166715861,
  properties: {
    r'notepadData': PropertySchema(
      id: 0,
      name: r'notepadData',
      type: IsarType.string,
    ),
    r'notepadEditTime': PropertySchema(
      id: 1,
      name: r'notepadEditTime',
      type: IsarType.dateTime,
    ),
    r'notepadName': PropertySchema(
      id: 2,
      name: r'notepadName',
      type: IsarType.string,
    ),
    r'notepadType': PropertySchema(
      id: 3,
      name: r'notepadType',
      type: IsarType.bool,
    ),
    r'notepadViewTime': PropertySchema(
      id: 4,
      name: r'notepadViewTime',
      type: IsarType.dateTime,
    ),
    r'notepadsID': PropertySchema(
      id: 5,
      name: r'notepadsID',
      type: IsarType.long,
    ),
    r'notepadsParentID': PropertySchema(
      id: 6,
      name: r'notepadsParentID',
      type: IsarType.long,
    )
  },
  estimateSize: _notepadFileEstimateSize,
  serialize: _notepadFileSerialize,
  deserialize: _notepadFileDeserialize,
  deserializeProp: _notepadFileDeserializeProp,
  idName: r'notepadID',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _notepadFileGetId,
  getLinks: _notepadFileGetLinks,
  attach: _notepadFileAttach,
  version: '3.1.0+1',
);

int _notepadFileEstimateSize(
  NotepadFile object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.notepadData;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
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

void _notepadFileSerialize(
  NotepadFile object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.notepadData);
  writer.writeDateTime(offsets[1], object.notepadEditTime);
  writer.writeString(offsets[2], object.notepadName);
  writer.writeBool(offsets[3], object.notepadType);
  writer.writeDateTime(offsets[4], object.notepadViewTime);
  writer.writeLong(offsets[5], object.notepadsID);
  writer.writeLong(offsets[6], object.notepadsParentID);
}

NotepadFile _notepadFileDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NotepadFile();
  object.notepadData = reader.readStringOrNull(offsets[0]);
  object.notepadEditTime = reader.readDateTimeOrNull(offsets[1]);
  object.notepadID = id;
  object.notepadName = reader.readStringOrNull(offsets[2]);
  object.notepadType = reader.readBoolOrNull(offsets[3]);
  object.notepadViewTime = reader.readDateTimeOrNull(offsets[4]);
  object.notepadsID = reader.readLongOrNull(offsets[5]);
  object.notepadsParentID = reader.readLongOrNull(offsets[6]);
  return object;
}

P _notepadFileDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _notepadFileGetId(NotepadFile object) {
  return object.notepadID ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _notepadFileGetLinks(NotepadFile object) {
  return [];
}

void _notepadFileAttach(
    IsarCollection<dynamic> col, Id id, NotepadFile object) {
  object.notepadID = id;
}

extension NotepadFileQueryWhereSort
    on QueryBuilder<NotepadFile, NotepadFile, QWhere> {
  QueryBuilder<NotepadFile, NotepadFile, QAfterWhere> anyNotepadID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NotepadFileQueryWhere
    on QueryBuilder<NotepadFile, NotepadFile, QWhereClause> {
  QueryBuilder<NotepadFile, NotepadFile, QAfterWhereClause> notepadIDEqualTo(
      Id notepadID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: notepadID,
        upper: notepadID,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterWhereClause> notepadIDNotEqualTo(
      Id notepadID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: notepadID, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: notepadID, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: notepadID, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: notepadID, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterWhereClause>
      notepadIDGreaterThan(Id notepadID, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: notepadID, includeLower: include),
      );
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterWhereClause> notepadIDLessThan(
      Id notepadID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: notepadID, includeUpper: include),
      );
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterWhereClause> notepadIDBetween(
    Id lowerNotepadID,
    Id upperNotepadID, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerNotepadID,
        includeLower: includeLower,
        upper: upperNotepadID,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NotepadFileQueryFilter
    on QueryBuilder<NotepadFile, NotepadFile, QFilterCondition> {
  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadData',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadData',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadDataEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadDataGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadDataLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadDataBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadDataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notepadData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadDataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notepadData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadDataContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notepadData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadDataMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notepadData',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadData',
        value: '',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notepadData',
        value: '',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadEditTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadEditTime',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadEditTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadEditTime',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadEditTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadEditTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadEditTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadEditTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadEditTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadEditTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadEditTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadEditTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadID',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadID',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadIDEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadIDGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadIDLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadIDBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadName',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadName',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadNameEqualTo(
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

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadNameGreaterThan(
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

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadNameLessThan(
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

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadNameBetween(
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

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadNameStartsWith(
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

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadNameEndsWith(
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

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notepadName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notepadName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadName',
        value: '',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notepadName',
        value: '',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadType',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadType',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadTypeEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadType',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadViewTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadViewTime',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadViewTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadViewTime',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadViewTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadViewTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadViewTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadViewTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadViewTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadViewTime',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadViewTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadViewTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadsIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadsID',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadsIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadsID',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadsIDEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadsID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadsIDGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadsID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadsIDLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadsID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadsIDBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadsID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadsParentIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notepadsParentID',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadsParentIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notepadsParentID',
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadsParentIDEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notepadsParentID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadsParentIDGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notepadsParentID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadsParentIDLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notepadsParentID',
        value: value,
      ));
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterFilterCondition>
      notepadsParentIDBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notepadsParentID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NotepadFileQueryObject
    on QueryBuilder<NotepadFile, NotepadFile, QFilterCondition> {}

extension NotepadFileQueryLinks
    on QueryBuilder<NotepadFile, NotepadFile, QFilterCondition> {}

extension NotepadFileQuerySortBy
    on QueryBuilder<NotepadFile, NotepadFile, QSortBy> {
  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> sortByNotepadData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadData', Sort.asc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> sortByNotepadDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadData', Sort.desc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> sortByNotepadEditTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadEditTime', Sort.asc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy>
      sortByNotepadEditTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadEditTime', Sort.desc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> sortByNotepadName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadName', Sort.asc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> sortByNotepadNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadName', Sort.desc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> sortByNotepadType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadType', Sort.asc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> sortByNotepadTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadType', Sort.desc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> sortByNotepadViewTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadViewTime', Sort.asc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy>
      sortByNotepadViewTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadViewTime', Sort.desc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> sortByNotepadsID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsID', Sort.asc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> sortByNotepadsIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsID', Sort.desc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy>
      sortByNotepadsParentID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsParentID', Sort.asc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy>
      sortByNotepadsParentIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsParentID', Sort.desc);
    });
  }
}

extension NotepadFileQuerySortThenBy
    on QueryBuilder<NotepadFile, NotepadFile, QSortThenBy> {
  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> thenByNotepadData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadData', Sort.asc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> thenByNotepadDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadData', Sort.desc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> thenByNotepadEditTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadEditTime', Sort.asc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy>
      thenByNotepadEditTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadEditTime', Sort.desc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> thenByNotepadID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadID', Sort.asc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> thenByNotepadIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadID', Sort.desc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> thenByNotepadName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadName', Sort.asc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> thenByNotepadNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadName', Sort.desc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> thenByNotepadType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadType', Sort.asc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> thenByNotepadTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadType', Sort.desc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> thenByNotepadViewTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadViewTime', Sort.asc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy>
      thenByNotepadViewTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadViewTime', Sort.desc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> thenByNotepadsID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsID', Sort.asc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy> thenByNotepadsIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsID', Sort.desc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy>
      thenByNotepadsParentID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsParentID', Sort.asc);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QAfterSortBy>
      thenByNotepadsParentIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notepadsParentID', Sort.desc);
    });
  }
}

extension NotepadFileQueryWhereDistinct
    on QueryBuilder<NotepadFile, NotepadFile, QDistinct> {
  QueryBuilder<NotepadFile, NotepadFile, QDistinct> distinctByNotepadData(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notepadData', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QDistinct>
      distinctByNotepadEditTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notepadEditTime');
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QDistinct> distinctByNotepadName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notepadName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QDistinct> distinctByNotepadType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notepadType');
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QDistinct>
      distinctByNotepadViewTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notepadViewTime');
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QDistinct> distinctByNotepadsID() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notepadsID');
    });
  }

  QueryBuilder<NotepadFile, NotepadFile, QDistinct>
      distinctByNotepadsParentID() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notepadsParentID');
    });
  }
}

extension NotepadFileQueryProperty
    on QueryBuilder<NotepadFile, NotepadFile, QQueryProperty> {
  QueryBuilder<NotepadFile, int, QQueryOperations> notepadIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadID');
    });
  }

  QueryBuilder<NotepadFile, String?, QQueryOperations> notepadDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadData');
    });
  }

  QueryBuilder<NotepadFile, DateTime?, QQueryOperations>
      notepadEditTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadEditTime');
    });
  }

  QueryBuilder<NotepadFile, String?, QQueryOperations> notepadNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadName');
    });
  }

  QueryBuilder<NotepadFile, bool?, QQueryOperations> notepadTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadType');
    });
  }

  QueryBuilder<NotepadFile, DateTime?, QQueryOperations>
      notepadViewTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadViewTime');
    });
  }

  QueryBuilder<NotepadFile, int?, QQueryOperations> notepadsIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadsID');
    });
  }

  QueryBuilder<NotepadFile, int?, QQueryOperations> notepadsParentIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notepadsParentID');
    });
  }
}
