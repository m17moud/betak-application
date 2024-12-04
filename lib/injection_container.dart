import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
//!bloc
//Login Bloc

//!usecases
//login usecses
  // sl.registerLazySingleton(() => UserLoginUseCase(sl()));

//!repositories
  // sl.registerLazySingleton<UserLoginRepository>(
  //   () => UserLoginRepositoryImp(networkInfo: sl(), local: sl(), remote: sl()),
  // );

//!data sources
// Login
  // sl.registerLazySingleton<UserRemoteDataSource>(
  //     () => UserRemoteDataSourceImpl(dio: DioConsumer(dio: Dio())));
  // sl.registerLazySingleton<UserLocalDataSource>(
  //     () => UserLocalDataSourceImpl());

//!core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioConsumer(dio: sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
