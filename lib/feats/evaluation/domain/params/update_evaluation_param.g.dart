// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_evaluation_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateEvaluationParamsImpl _$$UpdateEvaluationParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateEvaluationParamsImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      examId: (json['examId'] as num?)?.toInt() ?? 0,
      clubId: (json['clubId'] as num?)?.toInt() ?? 0,
      questionId: (json['questionId'] as num?)?.toInt() ?? 0,
      coachId: (json['coachId'] as num?)?.toInt() ?? 0,
      answer: json['answer'] as String?,
      score: (json['score'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UpdateEvaluationParamsImplToJson(
        _$UpdateEvaluationParamsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'examId': instance.examId,
      'clubId': instance.clubId,
      'questionId': instance.questionId,
      'coachId': instance.coachId,
      'answer': instance.answer,
      'score': instance.score,
    };
