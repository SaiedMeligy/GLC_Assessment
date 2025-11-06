import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Features/home/logic/home_cubit.dart';
import '../network/local/cach_repository.dart';
import '../network/local/cache_helper.dart';

GetIt getIt = GetIt.instance..allowReassignment = true;

Future<void> initGetIt() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  // Helpers
  getIt.registerLazySingleton<CacheHelper>(() => CacheImplementation(sharedPreferences));

  // Cache Repo
  getIt.registerLazySingleton<CacheRepository>(
        () => CacheRepository(getIt<CacheHelper>()),
  );

  // Data Source


  getIt.registerFactory<HomeCubit>(
        () => HomeCubit(repo: getIt<CacheRepository>()),
  );
}
