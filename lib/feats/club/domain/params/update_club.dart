import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dot_coaching/feats/club/domain/entities/club.dart';
import 'package:dot_coaching/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_club.freezed.dart';

@freezed
class UpdateClubParams with _$UpdateClubParams {
  const factory UpdateClubParams({
    required String id,
    required String name,
    required String description,
    required File image,
    required SportType type,
  }) = _UpdateClubParams;

  const UpdateClubParams._();

  FormData toFormData() => FormData.fromMap({
        'id': id,
        'name': name,
        'description': description,
        'type': type.value,
        'image': MultipartFile.fromFileSync(image.path),
      });
}
