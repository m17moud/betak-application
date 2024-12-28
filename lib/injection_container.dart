
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/Network/network_info.dart';
import 'core/api/dio_consumer.dart';
import 'features/auth_for_client/sign_in/data/datasources/customer_login_local_data_source.dart';
import 'features/auth_for_client/sign_in/data/datasources/customer_login_remote_data_source.dart';
import 'features/auth_for_client/sign_in/data/repositories/customer_login_repository_imp.dart';
import 'features/auth_for_client/sign_in/domain/repositories/customer_login_repository.dart';
import 'features/auth_for_client/sign_in/domain/usecases/customer_login_usecase.dart';
import 'features/auth_for_client/sign_in/domain/usecases/customer_logout_usecase.dart';
import 'features/auth_for_client/sign_in/presentation/cubit/customer_login_cubit.dart';
import 'features/auth_for_client/sign_up/data/datasources/client_signup_remote_datasource.dart';
import 'features/auth_for_client/sign_up/data/repositories/client_signup_repository_impl.dart';
import 'features/auth_for_client/sign_up/domain/repositories/client_signup_repository.dart';
import 'features/auth_for_client/sign_up/domain/usecases/add_client_usecase.dart';
import 'features/auth_for_client/sign_up/presentation/cubit/sign_up_cubit.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Core dependencies
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl())); // Register NetworkInfo early
  sl.registerLazySingleton(() => DioConsumer(dio: sl()));

  //! External dependencies
  sl.registerLazySingleton(() => http.Client());

  //! Data sources
  // Login
  sl.registerLazySingleton<CustomerLoginRemoteDataSource>(
        () => CustomerLoginRemoteDataSourceImpl(dio: DioConsumer(dio: sl())),
  );
  sl.registerLazySingleton<CustomerLoginLocalDataSource>(
        () => CustomerLoginLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<ClientSignupRemoteDatasource>(
        () => ClientSignupRemoteDatasourceImpl(dio: DioConsumer(dio: sl())),
  );

  //! Repositories
  sl.registerLazySingleton<CustomerLoginRepository>(
        () => CustomerLoginRepositoryImp(
      networkInfo: sl(), // This will work because NetworkInfo is registered first
      local: sl(),
      remote: sl(),
    ),
  );

  sl.registerLazySingleton<ClientSignupRepository>(
        () => ClientSignupRepositoryImpl(
      networkInfo: sl(),
      clientSignupRemoteDatasource: sl(),
    ),
  );

  //! Use cases
  sl.registerLazySingleton(() => CustomerLoginUsecase(sl()));
  sl.registerLazySingleton(() => CustomerLogoutUseCase(sl()));
  sl.registerLazySingleton(() => AddClientUsecase(clientSignupRepository: sl()));

  //! Cubits
  sl.registerFactory(
        () => CustomerLoginCubit(customerLogin: sl(), customerLogout: sl()),
  );
  sl.registerFactory(
        () => SignUpCubit(addClientUsecase: sl()),
  );
}
