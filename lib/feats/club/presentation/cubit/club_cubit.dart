import 'dart:async';
import 'dart:io';

import 'package:dot_coaching/core/core.dart';
import 'package:dot_coaching/feats/feats.dart';
import 'package:dot_coaching/utils/utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'club_cubit.freezed.dart';
part 'club_state.dart';

class ClubCubit extends Cubit<ClubState> {
  final ClubRepo _clubRepo;
  final UserRepo _userRepo;
  final ImagePickerClient _imagePickerClient;

  ClubCubit(
    this._clubRepo,
    this._userRepo,
    this._imagePickerClient,
  ) : super(ClubState());

  void clear() {
    safeEmit(
      isClosed: isClosed,
      emit: emit,
      state: ClubState(),
    );
  }

  void emitInitial() => safeEmit(
        isClosed: isClosed,
        emit: emit,
        state: state.copyWith(
          state: BaseState.initial,
          image: null,
          updatedClub: null,
        ),
      );

  void emitLoading() => safeEmit(
        isClosed: isClosed,
        emit: emit,
        state: state.copyWith(state: BaseState.loading),
      );

  Future<void> init() async {
    await fetchLocalUser();
    await getAll();
  }

  Future<void> fetchLocalUser() async {
    emitLoading();
    final res = await _userRepo.getMe();
    return res.fold(
      (l) => null,
      (r) {
        safeEmit(
          isClosed: isClosed,
          emit: emit,
          state: state.copyWith(user: UserModel.fromEntity(r)),
        );
      },
    );
  }

  Future<void> getAll() async {
    emitLoading();
    final res = await _clubRepo.getAll(const PaginationParams());

    res.fold(
      (l) => emitInitial(),
      (r) {
        safeEmit(
          isClosed: isClosed,
          emit: emit,
          state: state.copyWith(
            state: BaseState.success,
            clubs: r,
            filteredClubs: r,
          ),
        );

        for (final club in r) {
          _subToTopic(club.id);
        }
      },
    );
  }

  void _subToTopic(int clubId) async {
    final topic = 'club_$clubId';
    await FirebaseMessaging.instance.subscribeToTopic(topic);
    log.e('subscribed to $topic');
  }

  Future<void> create(
    CreateClubParams params,
  ) async {
    emitLoading();
    final res = await _clubRepo.create(params);

    res.fold(
      (l) => safeEmit(
        isClosed: isClosed,
        emit: emit,
        state: state.copyWith(
          state: BaseState.failure,
          failure: l,
        ),
      ),
      (r) {
        final List<ClubModel> clubs = List.from(state.clubs);
        clubs.add(r);

        safeEmit(
          isClosed: isClosed,
          emit: emit,
          state: state.copyWith(
            state: BaseState.success,
            clubs: clubs,
            filteredClubs: clubs,
          ),
        );
      },
    );
  }

  Future<void> update(
    UpdateClubParams params,
  ) async {
    emitLoading();
    final res = await _clubRepo.update(params);

    res.fold(
      (l) => safeEmit(
        isClosed: isClosed,
        emit: emit,
        state: state.copyWith(
          state: BaseState.failure,
          failure: l,
        ),
      ),
      (r) {
        final List<ClubModel> clubs = List.from(state.clubs);
        final index = clubs.indexWhere((element) => element.id == r.id);
        clubs[index] = r;

        safeEmit(
          isClosed: isClosed,
          emit: emit,
          state: state.copyWith(
            state: BaseState.success,
            clubs: clubs,
            filteredClubs: clubs,
            updatedClub: r,
          ),
        );
      },
    );
  }

  Future<void> delete(
    ByIdParams params,
  ) async {
    emitLoading();
    final res = await _clubRepo.delete(params);

    res.fold(
      (l) => safeEmit(
        isClosed: isClosed,
        emit: emit,
        state: state.copyWith(
          state: BaseState.failure,
          failure: l,
        ),
      ),
      (r) {
        final List<ClubModel> clubs = List.from(state.clubs);
        clubs.removeWhere((element) => element.id == r.id);

        safeEmit(
          isClosed: isClosed,
          emit: emit,
          state: state.copyWith(
            state: BaseState.success,
            clubs: clubs,
            filteredClubs: clubs,
          ),
        );
      },
    );
  }

  Future<void> getById(
    ByIdParams params,
  ) async {
    emitLoading();
    final res = await _clubRepo.getById(params);

    res.fold(
      (l) => safeEmit(
        isClosed: isClosed,
        emit: emit,
        state: state.copyWith(
          state: BaseState.failure,
          failure: l,
        ),
      ),
      (r) {
        final List<ClubModel> clubs = List.from(state.clubs);
        final index = clubs.indexWhere((element) => element.id == r.id);
        clubs[index] = r;
        safeEmit(
          isClosed: isClosed,
          emit: emit,
          state: state.copyWith(
            state: BaseState.success,
            clubs: clubs,
            filteredClubs: clubs,
          ),
        );
      },
    );
  }

  Future<void> getMembers(
    PaginationParams params,
    int clubId,
  ) async {
    emitLoading();
    final res = await _clubRepo.getMembers(params, clubId);

    res.fold(
      (l) => emitInitial(),
      (r) {
        safeEmit(
          isClosed: isClosed,
          emit: emit,
          state: state.copyWith(
            state: BaseState.success,
            members: r,
            filteredMembers: r,
          ),
        );
      },
    );
  }

  Future<void> kick(
    int clubId,
    int userId,
  ) async {
    emitLoading();
    final res = await _clubRepo.kick(clubId, userId);

    res.fold(
      (l) => safeEmit(
        isClosed: isClosed,
        emit: emit,
        state: state.copyWith(
          state: BaseState.failure,
          failure: l,
        ),
      ),
      (r) {
        final List<UserModel> members = List.from(state.members);
        members.removeWhere((element) => element.id == r.id);

        safeEmit(
          isClosed: isClosed,
          emit: emit,
          state: state.copyWith(
            state: BaseState.success,
            members: members,
          ),
        );
      },
    );
  }

  Future<void> leave(
    int clubId,
  ) async {
    emitLoading();
    final res = await _clubRepo.leave(clubId);

    res.fold(
      (l) => safeEmit(
        isClosed: isClosed,
        emit: emit,
        state: state.copyWith(
          state: BaseState.failure,
          failure: l,
        ),
      ),
      (r) {
        final List<ClubModel> clubs = List.from(state.clubs);
        clubs.removeWhere((element) => element.id == r.id);

        safeEmit(
          isClosed: isClosed,
          emit: emit,
          state: state.copyWith(
            state: BaseState.success,
            clubs: clubs,
            filteredClubs: clubs,
          ),
        );
      },
    );
  }

  Future<void> addUser(
    int clubId,
    int userId,
  ) async {
    emitLoading();
    final res = await _clubRepo.addUser(clubId, userId);

    res.fold(
      (l) => safeEmit(
        isClosed: isClosed,
        emit: emit,
        state: state.copyWith(
          state: BaseState.failure,
          failure: l,
        ),
      ),
      (r) {
        safeEmit(
          isClosed: isClosed,
          emit: emit,
          state: state.copyWith(
            state: BaseState.success,
          ),
        );
      },
    );
  }

  Future<void> searchUser(
    String query,
  ) async {
    emitLoading();
    final res = await _userRepo.search(query);

    res.fold(
      (l) => safeEmit(
        isClosed: isClosed,
        emit: emit,
        state: state.copyWith(
          state: BaseState.failure,
          failure: l,
        ),
      ),
      (r) {
        safeEmit(
          isClosed: isClosed,
          emit: emit,
          state: state.copyWith(
            state: BaseState.success,
            users: r,
          ),
        );
      },
    );
  }

  void searchClub(String query) {
    final filteredClubs = state.clubs.where((element) {
      return element.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    safeEmit(
      isClosed: isClosed,
      emit: emit,
      state: state.copyWith(
        filteredClubs: filteredClubs,
      ),
    );
  }

  void searchMember(String query) {
    final filteredMembers = state.members.where((element) {
      return element.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    safeEmit(
      isClosed: isClosed,
      emit: emit,
      state: state.copyWith(
        filteredMembers: filteredMembers,
      ),
    );
  }

  void pickImageFromGallery() async {
    final res = await _imagePickerClient.getImageFromGallery();

    res.fold(
      (l) {},
      (r) {
        safeEmit(
          isClosed: isClosed,
          emit: emit,
          state: state.copyWith(
            image: File(r.path),
          ),
        );
      },
    );
  }

  void pickImageFromCamera() async {
    final res = await _imagePickerClient.getImageFromCamera();

    res.fold(
      (l) {},
      (r) {
        safeEmit(
          isClosed: isClosed,
          emit: emit,
          state: state.copyWith(
            image: File(r.path),
          ),
        );
      },
    );
  }
}
