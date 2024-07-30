// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEvaluationEntityCollection on Isar {
  IsarCollection<EvaluationEntity> get evaluationEntitys => this.collection();
}

const EvaluationEntitySchema = CollectionSchema(
  name: r'EvaluationEntity',
  id: 730156589358156152,
  properties: {
    r'answer': PropertySchema(
      id: 0,
      name: r'answer',
      type: IsarType.string,
    ),
    r'athleteId': PropertySchema(
      id: 1,
      name: r'athleteId',
      type: IsarType.long,
    ),
    r'clubId': PropertySchema(
      id: 2,
      name: r'clubId',
      type: IsarType.long,
    ),
    r'coachId': PropertySchema(
      id: 3,
      name: r'coachId',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'examId': PropertySchema(
      id: 5,
      name: r'examId',
      type: IsarType.long,
    ),
    r'questionId': PropertySchema(
      id: 6,
      name: r'questionId',
      type: IsarType.long,
    ),
    r'score': PropertySchema(
      id: 7,
      name: r'score',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _evaluationEntityEstimateSize,
  serialize: _evaluationEntitySerialize,
  deserialize: _evaluationEntityDeserialize,
  deserializeProp: _evaluationEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'exam': LinkSchema(
      id: -5549304484117096092,
      name: r'exam',
      target: r'ExamEntity',
      single: true,
    ),
    r'club': LinkSchema(
      id: 3667859887242535949,
      name: r'club',
      target: r'ClubEntity',
      single: true,
    ),
    r'question': LinkSchema(
      id: -2693897754946635171,
      name: r'question',
      target: r'QuestionEntity',
      single: true,
    ),
    r'athlete': LinkSchema(
      id: 163504675277135956,
      name: r'athlete',
      target: r'UserEntity',
      single: true,
    ),
    r'coach': LinkSchema(
      id: 1567148811516401605,
      name: r'coach',
      target: r'UserEntity',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _evaluationEntityGetId,
  getLinks: _evaluationEntityGetLinks,
  attach: _evaluationEntityAttach,
  version: '3.1.0+1',
);

int _evaluationEntityEstimateSize(
  EvaluationEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.answer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _evaluationEntitySerialize(
  EvaluationEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.answer);
  writer.writeLong(offsets[1], object.athleteId);
  writer.writeLong(offsets[2], object.clubId);
  writer.writeLong(offsets[3], object.coachId);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeLong(offsets[5], object.examId);
  writer.writeLong(offsets[6], object.questionId);
  writer.writeLong(offsets[7], object.score);
  writer.writeDateTime(offsets[8], object.updatedAt);
}

EvaluationEntity _evaluationEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EvaluationEntity(
    answer: reader.readStringOrNull(offsets[0]),
    athleteId: reader.readLongOrNull(offsets[1]) ?? 0,
    clubId: reader.readLongOrNull(offsets[2]) ?? 0,
    coachId: reader.readLongOrNull(offsets[3]) ?? 0,
    createdAt: reader.readDateTimeOrNull(offsets[4]),
    examId: reader.readLongOrNull(offsets[5]) ?? 0,
    id: id,
    questionId: reader.readLongOrNull(offsets[6]) ?? 0,
    score: reader.readLongOrNull(offsets[7]),
    updatedAt: reader.readDateTimeOrNull(offsets[8]),
  );
  return object;
}

P _evaluationEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 3:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 6:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _evaluationEntityGetId(EvaluationEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _evaluationEntityGetLinks(EvaluationEntity object) {
  return [
    object.exam,
    object.club,
    object.question,
    object.athlete,
    object.coach
  ];
}

void _evaluationEntityAttach(
    IsarCollection<dynamic> col, Id id, EvaluationEntity object) {
  object.id = id;
  object.exam.attach(col, col.isar.collection<ExamEntity>(), r'exam', id);
  object.club.attach(col, col.isar.collection<ClubEntity>(), r'club', id);
  object.question
      .attach(col, col.isar.collection<QuestionEntity>(), r'question', id);
  object.athlete.attach(col, col.isar.collection<UserEntity>(), r'athlete', id);
  object.coach.attach(col, col.isar.collection<UserEntity>(), r'coach', id);
}

extension EvaluationEntityQueryWhereSort
    on QueryBuilder<EvaluationEntity, EvaluationEntity, QWhere> {
  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EvaluationEntityQueryWhere
    on QueryBuilder<EvaluationEntity, EvaluationEntity, QWhereClause> {
  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterWhereClause> idBetween(
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

extension EvaluationEntityQueryFilter
    on QueryBuilder<EvaluationEntity, EvaluationEntity, QFilterCondition> {
  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      answerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'answer',
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      answerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'answer',
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      answerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      answerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      answerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      answerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      answerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      answerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      answerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      answerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'answer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      answerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answer',
        value: '',
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      answerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'answer',
        value: '',
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      athleteIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'athleteId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      athleteIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'athleteId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      athleteIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'athleteId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      athleteIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'athleteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      clubIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clubId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      clubIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clubId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      clubIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clubId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      clubIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clubId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      coachIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coachId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      coachIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coachId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      coachIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coachId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      coachIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coachId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      examIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      examIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'examId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      examIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'examId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      examIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'examId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      questionIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      questionIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      questionIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      questionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      scoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'score',
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      scoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'score',
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      scoreEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      scoreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      scoreLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      scoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EvaluationEntityQueryObject
    on QueryBuilder<EvaluationEntity, EvaluationEntity, QFilterCondition> {}

extension EvaluationEntityQueryLinks
    on QueryBuilder<EvaluationEntity, EvaluationEntity, QFilterCondition> {
  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition> exam(
      FilterQuery<ExamEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'exam');
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      examIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'exam', 0, true, 0, true);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition> club(
      FilterQuery<ClubEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'club');
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      clubIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'club', 0, true, 0, true);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      question(FilterQuery<QuestionEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'question');
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      questionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'question', 0, true, 0, true);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      athlete(FilterQuery<UserEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'athlete');
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      athleteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'athlete', 0, true, 0, true);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition> coach(
      FilterQuery<UserEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'coach');
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterFilterCondition>
      coachIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'coach', 0, true, 0, true);
    });
  }
}

extension EvaluationEntityQuerySortBy
    on QueryBuilder<EvaluationEntity, EvaluationEntity, QSortBy> {
  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      sortByAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answer', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      sortByAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answer', Sort.desc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      sortByAthleteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'athleteId', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      sortByAthleteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'athleteId', Sort.desc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      sortByClubId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clubId', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      sortByClubIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clubId', Sort.desc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      sortByCoachId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coachId', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      sortByCoachIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coachId', Sort.desc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      sortByExamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      sortByExamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.desc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      sortByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      sortByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy> sortByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      sortByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension EvaluationEntityQuerySortThenBy
    on QueryBuilder<EvaluationEntity, EvaluationEntity, QSortThenBy> {
  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answer', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answer', Sort.desc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByAthleteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'athleteId', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByAthleteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'athleteId', Sort.desc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByClubId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clubId', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByClubIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clubId', Sort.desc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByCoachId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coachId', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByCoachIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coachId', Sort.desc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByExamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByExamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.desc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy> thenByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension EvaluationEntityQueryWhereDistinct
    on QueryBuilder<EvaluationEntity, EvaluationEntity, QDistinct> {
  QueryBuilder<EvaluationEntity, EvaluationEntity, QDistinct> distinctByAnswer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'answer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QDistinct>
      distinctByAthleteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'athleteId');
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QDistinct>
      distinctByClubId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clubId');
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QDistinct>
      distinctByCoachId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coachId');
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QDistinct>
      distinctByExamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'examId');
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QDistinct>
      distinctByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionId');
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QDistinct>
      distinctByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'score');
    });
  }

  QueryBuilder<EvaluationEntity, EvaluationEntity, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension EvaluationEntityQueryProperty
    on QueryBuilder<EvaluationEntity, EvaluationEntity, QQueryProperty> {
  QueryBuilder<EvaluationEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EvaluationEntity, String?, QQueryOperations> answerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answer');
    });
  }

  QueryBuilder<EvaluationEntity, int, QQueryOperations> athleteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'athleteId');
    });
  }

  QueryBuilder<EvaluationEntity, int, QQueryOperations> clubIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clubId');
    });
  }

  QueryBuilder<EvaluationEntity, int, QQueryOperations> coachIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coachId');
    });
  }

  QueryBuilder<EvaluationEntity, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<EvaluationEntity, int, QQueryOperations> examIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'examId');
    });
  }

  QueryBuilder<EvaluationEntity, int, QQueryOperations> questionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionId');
    });
  }

  QueryBuilder<EvaluationEntity, int?, QQueryOperations> scoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'score');
    });
  }

  QueryBuilder<EvaluationEntity, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
