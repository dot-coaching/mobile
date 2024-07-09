import 'package:dot_coaching/core/services/services.dart';
import 'package:dot_coaching/feats/feats.dart';
import 'package:get_it/get_it.dart';

GetIt di = GetIt.instance;

Future<void> initDependencies() async {
  await _initStore();

  di.registerLazySingleton<DioClient>(() => DioClient(di()));

  _intiRepos();
  _initUsecase();
  _initCubits();
}

Future<void> _initStore() async {
  await IsarClient().initIsar();
  di.registerSingleton<IsarClient>(IsarClient());
}

void _intiRepos() {
  di.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      di<DioClient>(),
      di<IsarClient>(),
    ),
  );

  di.registerLazySingleton<UserRepo>(
    () => UserRepoImpl(
      di<DioClient>(),
      di<IsarClient>(),
    ),
  );
}

void _initUsecase() {}

void _initCubits() {
  di.registerFactory(
    () => AuthCubit(),
  );

  di.registerFactory(
    () => UserCubit(),
  );
}
