import 'package:dartz/dartz.dart';
import 'package:dot_coaching/core/core.dart';
import 'package:dot_coaching/feats/feats.dart';

class QuestionRepoImpl implements QuestionRepo {
  final DioClient _remote;
  final IsarClient _local;

  QuestionRepoImpl(this._remote, this._local);

  @override
  Future<Either<Failure, QuestionModel>> create(
    CreateQuestionParams params,
  ) async {
    final res = await _remote.postRequest(
      ListAPI.CLUB_EXAM_QUESTION,
      data: params.toJson(),
      converter: (res) => QuestionModel.fromJson(res['data']),
    );

    return res;
  }

  @override
  Future<Either<Failure, QuestionModel>> delete(
    ByIdParams params,
  ) async {
    final res = await _remote.deleteRequest(
      '${ListAPI.CLUB_EXAM_QUESTION}/${params.id}',
      converter: (res) => QuestionModel.fromJson(res['data']),
    );

    return res;
  }

  @override
  Future<Either<Failure, List<QuestionModel>>> getAll(
    PaginationParams params,
  ) async {
    final res = await _remote.getRequest(
      ListAPI.CLUB_EXAM_QUESTION,
      converter: (res) {
        final List<QuestionModel> questions = [];
        for (final item in res['data']) {
          questions.add(QuestionModel.fromJson(item));
        }
        return questions;
      },
    );

    return res;
  }

  @override
  Future<Either<Failure, QuestionModel>> getById(
    ByIdParams params,
  ) async {
    final res = await _remote.getRequest(
      '${ListAPI.CLUB_EXAM_QUESTION}/${params.id}',
      converter: (res) => QuestionModel.fromJson(res['data']),
    );

    return res;
  }

  @override
  Future<Either<Failure, QuestionModel>> update(
    UpdateQuestionParams params,
  ) async {
    final res = await _remote.putRequest(
      '${ListAPI.CLUB_EXAM_QUESTION}/${params.id}',
      data: params.toJson(),
      converter: (res) => QuestionModel.fromJson(res['data']),
    );

    return res;
  }
}