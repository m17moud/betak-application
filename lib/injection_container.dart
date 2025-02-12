import 'features/add_product/data/datasources/add_product_remote_datasource.dart';
import 'features/add_product/data/repositories/add_product_repository_impl.dart';
import 'features/add_product/domain/repositories/add_product_repository.dart';
import 'features/add_product/domain/usecases/add_product_usecase.dart';
import 'features/add_product/presentation/cubit/add_product_cubit.dart';
import 'features/auth_for_merchants/sign_up/domain/usecases/add_merchant_usecase.dart';

import 'features/auth_for_merchants/sign_up/data/datasources/merchant_signup_remote_datasource.dart';
import 'features/auth_for_merchants/sign_up/data/repositories/merchant_signup_repository_impl.dart';
import 'features/auth_for_merchants/sign_up/domain/repositories/merchant_signup_repository.dart';
import 'features/auth_for_merchants/sign_up/presentation/cubit/merchant_sign_up_cubit.dart';
import 'features/home/data/datasources/home_department_remote_data_source.dart';
import 'features/home/data/repositories/home_department_repository_impl.dart';
import 'features/home/domain/usecases/home_usecase.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/auth_for_merchants/sign_in/data/datasources/merchant_login_local_data_source.dart';
import 'features/auth_for_merchants/sign_in/data/datasources/merchant_login_remote_data_source.dart';
import 'features/auth_for_merchants/sign_in/data/repositories/merchant_login_repository_imp.dart';
import 'features/auth_for_merchants/sign_in/domain/repositories/merchant_login_repository.dart';
import 'features/auth_for_merchants/sign_in/domain/usecases/merchant_login_usecase.dart';
import 'features/auth_for_merchants/sign_in/domain/usecases/merchant_logout_usecase.dart';
import 'features/auth_for_merchants/sign_in/presentation/cubit/merchant_login_cubit.dart';
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
import 'features/home/domain/repositories/home_department_repository.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Core dependencies
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl())); // Register NetworkInfo early
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

  //singup
  sl.registerLazySingleton<ClientSignupRemoteDatasource>(
    () => ClientSignupRemoteDatasourceImpl(dio: DioConsumer(dio: sl())),
  );
  sl.registerLazySingleton<MerchantSignupRemoteDatasource>(
    () => MerchantSignupRemoteDatasourceImpl(dio: DioConsumer(dio: sl())),
  );

  sl.registerLazySingleton<MerchantLoginRemoteDataSource>(
    () => MerchantLoginRemoteDataSourceImpl(dio: DioConsumer(dio: sl())),
  );
  sl.registerLazySingleton<MerchantLoginLocalDataSource>(
    () => MerchantLoginLocalDataSourceImpl(),
  );
  //home
  sl.registerLazySingleton<HomeDepartmentRemoteDataSource>(
    () => HomeDepartmentRemoteDataSourceImpl(dio: DioConsumer(dio: sl())),
  );

// add product
sl.registerLazySingleton<AddProductRemoteDatasource>(
    () => AddProductRemoteDatasourceImpl(dio: DioConsumer(dio: sl())),
  );
  //! Repositories
  sl.registerLazySingleton<CustomerLoginRepository>(
    () => CustomerLoginRepositoryImp(
      networkInfo:
          sl(), // This will work because NetworkInfo is registered first
      local: sl(),
      remote: sl(),
    ),
  );
//sign up
  sl.registerLazySingleton<ClientSignupRepository>(
    () => ClientSignupRepositoryImpl(
      networkInfo: sl(),
      clientSignupRemoteDatasource: sl(),
    ),
  );
  sl.registerLazySingleton<MerchantSignupRepository>(
    () => MerchantSignupRepositoryImpl(
      networkInfo: sl(),
      merchantSignupRemoteDatasource: sl(),
    ),
  );
//home
  sl.registerLazySingleton<HomeDepartmentRepository>(
    () => HomeDepartmentRepositoryImpl(remote: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<MerchantLoginRepository>(
    () => MerchantLoginRepositoryImp(
      networkInfo: sl(),
      local: sl(),
      remote: sl(),
    ),
  );

  // add product
  sl.registerLazySingleton<AddProductRepository>(
    () => AddProductRepositoryImpl(addProductRemoteDatasource: sl(), networkInfo: sl()),
  );
  //! Use cases
  //client
  sl.registerLazySingleton(() => CustomerLoginUsecase(sl()));
  sl.registerLazySingleton(() => CustomerLogoutUseCase(sl()));
  sl.registerLazySingleton(
      () => AddClientUsecase(clientSignupRepository: sl()));
  //merchant
  sl.registerLazySingleton(() => MerchantLoginUsecase(sl()));
  sl.registerLazySingleton(() => MerchantLogoutUseCase(sl()));
  sl.registerLazySingleton(
      () => AddMerchantUsecase(merchantSignupRepository: sl()));
  //home
  sl.registerLazySingleton(() => HomeUsecase(sl()));
  
  // add product
sl.registerLazySingleton(() => AddProductUsecase(addProductRepository: sl()));

  //! Cubits
  sl.registerFactory(
    () => CustomerLoginCubit(customerLogin: sl(), customerLogout: sl()),
  );
  sl.registerFactory(
    () => MerchantLoginCubit(merchantLogin: sl(), merchantLogout: sl()),
  );
  sl.registerFactory(
    () => SignUpCubit(addClientUsecase: sl()),
  );
  sl.registerFactory(
    () => MerchantSignUpCubit(addMerchantUsecase: sl()),
  );
  sl.registerFactory(
    () => HomeCubit(homeUsecase: sl()),
  );
   sl.registerFactory(
    () => AddProductCubit(addProductUsecase: sl()),
  );
}
