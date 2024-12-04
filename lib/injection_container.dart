
import 'package:betak/features/auth_for_client/sign_in/data/datasources/customer_login_local_data_source.dart';
import 'package:betak/features/auth_for_client/sign_in/data/datasources/customer_login_remote_data_source.dart';
import 'package:betak/features/auth_for_client/sign_in/data/repositories/customer_login_repository_imp.dart';
import 'package:betak/features/auth_for_client/sign_in/domain/repositories/customer_login_repository.dart';
import 'package:betak/features/auth_for_client/sign_in/domain/usecases/customer_login_usecase.dart';
import 'package:betak/features/auth_for_client/sign_in/domain/usecases/customer_logout_usecase.dart';
import 'package:betak/features/auth_for_client/sign_in/presentation/cubit/customer_login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
//!cubit
//Login cubit
  sl.registerLazySingleton(() => CustomerLoginCubit(customerLogin: sl(), customerLogout: sl()));

//!usecases
//customer login usecses
  sl.registerLazySingleton(() => CustomerLoginUsecase(sl()));
  sl.registerLazySingleton(() => CustomerLogoutUseCase(sl()));


//!repositories
  sl.registerLazySingleton<CustomerLoginRepository>(
    () => CustomerLoginRepositoryImp(networkInfo: sl(), local: sl(), remote: sl()),
  );

//!data sources
// Login
   sl.registerLazySingleton<CustomerLoginRemoteDataSource>(
      () => CustomerLoginRemoteDataSourceImpl(dio: DioConsumer(dio: Dio())));
   sl.registerLazySingleton<CustomerLoginLocalDataSource>(
       () => CustomerLoginLocalDataSourceImpl());

//!core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioConsumer(dio: sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
