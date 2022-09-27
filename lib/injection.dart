import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:mobile_development_test/data/repositories/city_repository_impl.dart';
import 'package:mobile_development_test/data/repositories/user_repository_impl.dart';
import 'package:mobile_development_test/domain/repositories/city_repository.dart';
import 'package:mobile_development_test/domain/repositories/user_repository.dart';
import 'package:mobile_development_test/domain/usecases/add_user.dart';
import 'package:mobile_development_test/domain/usecases/get_city_list.dart';
import 'package:mobile_development_test/domain/usecases/get_user_list.dart';
import 'package:mobile_development_test/presentation/bloc/city_bloc.dart';
import 'package:mobile_development_test/presentation/bloc/user_bloc.dart';
import 'package:mobile_development_test/presentation/pages/add_user_page.dart';

import 'data/datasources/remote_data_source.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => UserBloc(locator(), locator()));
  locator.registerFactory(() => CityBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetUserList(locator()));
  locator.registerLazySingleton(() => GetCityList(locator()));
  locator.registerLazySingleton(() => AddUser(locator()));

  // repository
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<CityRepository>(
    () => CityRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
