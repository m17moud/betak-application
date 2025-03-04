// ignore_for_file: depend_on_referenced_packages

import 'package:betak/features/add_like/domain/usecases/add_like_usecase.dart';
import 'package:betak/features/add_like/presentation/cubit/add_like_cubit.dart';
import 'package:betak/features/auth_for_client/client_check_session/data/datasources/client_check_session_remote_datasource.dart';
import 'package:betak/features/auth_for_client/client_check_session/data/repositories/client_check_session_repository_impl.dart';
import 'package:betak/features/auth_for_client/client_check_session/domain/repositories/client_check_session_repository.dart';
import 'package:betak/features/auth_for_client/client_check_session/domain/usecases/client_check_session_usecase.dart';
import 'package:betak/features/auth_for_client/client_check_session/presentation/cubit/client_check_session_cubit.dart';
import 'package:betak/features/category_products/data/datasources/products_remote_data_source.dart';
import 'package:betak/features/category_products/data/repositories/products_repository_impl.dart';
import 'package:betak/features/category_products/domain/repositories/product_repository.dart';
import 'package:betak/features/category_products/domain/usecases/products_usecase.dart';
import 'package:betak/features/category_products/presentation/cubit/category_products_cubit.dart';
import 'package:betak/features/manage_product/data/datasources/manage_product_remote_datasource.dart';
import 'package:betak/features/manage_product/data/repositories/manage_product_repository_impl.dart';
import 'package:betak/features/manage_product/domain/repositories/manage_product_repository.dart';
import 'package:betak/features/manage_product/domain/usecases/delete_product_usecase.dart';
import 'package:betak/features/manage_product/domain/usecases/update_product_usecase.dart';
import 'package:betak/features/manage_product/presentation/cubit/manage_product_cubit.dart';
import 'package:betak/features/merchant_%20products/presentation/cubit/merchant_products_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/Network/network_info.dart';
import 'core/api/dio_consumer.dart';
import 'features/add_like/data/datasources/add_like_remote_dataSource.dart';
import 'features/add_like/data/repositories/add_like_repository_impl.dart';
import 'features/add_like/domain/repositories/add_like_repository.dart';
import 'features/add_product/data/datasources/add_product_remote_datasource.dart';
import 'features/add_product/data/repositories/add_product_repository_impl.dart';
import 'features/add_product/domain/repositories/add_product_repository.dart';
import 'features/add_product/domain/usecases/add_product_usecase.dart';
import 'features/add_product/presentation/cubit/add_product_cubit.dart';
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
import 'features/auth_for_merchants/sign_in/data/datasources/merchant_login_local_data_source.dart';
import 'features/auth_for_merchants/sign_in/data/datasources/merchant_login_remote_data_source.dart';
import 'features/auth_for_merchants/sign_in/data/repositories/merchant_login_repository_imp.dart';
import 'features/auth_for_merchants/sign_in/domain/repositories/merchant_login_repository.dart';
import 'features/auth_for_merchants/sign_in/domain/usecases/merchant_login_usecase.dart';
import 'features/auth_for_merchants/sign_in/domain/usecases/merchant_logout_usecase.dart';
import 'features/auth_for_merchants/sign_in/presentation/cubit/merchant_login_cubit.dart';
import 'features/auth_for_merchants/sign_up/data/datasources/merchant_signup_remote_datasource.dart';
import 'features/auth_for_merchants/sign_up/data/repositories/merchant_signup_repository_impl.dart';
import 'features/auth_for_merchants/sign_up/domain/repositories/merchant_signup_repository.dart';
import 'features/auth_for_merchants/sign_up/domain/usecases/add_merchant_usecase.dart';
import 'features/auth_for_merchants/sign_up/presentation/cubit/merchant_sign_up_cubit.dart';
import 'features/home/data/datasources/home_department_remote_data_source.dart';
import 'features/home/data/repositories/home_department_repository_impl.dart';
import 'features/home/domain/repositories/home_department_repository.dart';
import 'features/home/domain/usecases/home_usecase.dart';
import 'features/home/presentation/cubit/home_cubit.dart';

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
// update product
  sl.registerLazySingleton<ManageProductRemoteDatasource>(
    () => ManageProductRemoteDatasourceImpl(dio: DioConsumer(dio: sl())),
  );

  sl.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(dio: DioConsumer(dio: sl())),
  );

// add like

  sl.registerLazySingleton<AddLikeRemoteDataSource>(
    () => AddLikeRemoteDataSourceImpl(dio: DioConsumer(dio: sl())),
  );

// check client session
  sl.registerLazySingleton<ClientCheckSessionRemoteDatasource>(
    () => ClientCheckSessionRemoteDatasourceImpl(dio: DioConsumer(dio: sl())),
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
  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(
      networkInfo:
          sl(), // This will work because NetworkInfo is registered first
      remote: sl(),
    ),
  );

  // add product
  sl.registerLazySingleton<AddProductRepository>(
    () => AddProductRepositoryImpl(
      addProductRemoteDatasource: sl(),
      networkInfo: sl(),
    ),
  );

// add like
  sl.registerLazySingleton<AddLikeRepository>(
    () => AddLikeRepositoryImpl(
      addLikeRemoteDatasource: sl(),
      networkInfo: sl(),
    ),
  );

  // update product
  sl.registerLazySingleton<ManageProductRepository>(
    () => ManageProductRepositoryImpl(
        manageProductRemoteDatasource: sl(), networkInfo: sl()),
  );

// client session
  sl.registerLazySingleton<ClientCheckSessionRepository>(
    () => ClientCheckSessionRepositoryImpl(remote: sl(), networkInfo: sl()),
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

  sl.registerLazySingleton(() => ProductsUsecase(sl()));
  // update product

  sl.registerLazySingleton(
      () => UpdateProductUsecase(manageProductRepository: sl()));
  sl.registerLazySingleton(
      () => DeleteProductUsecase(manageProductRepository: sl()));
// add like

  sl.registerLazySingleton(() => AddLikeUsecase(addLikeRepository: sl()));
// client session
  sl.registerLazySingleton(() => ClientCheckSessionUsecase(sl()));

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
    () => AddProductCubit(addProductUsecase: sl(), productsUsecase: sl()),
  );
  sl.registerFactory(
    () => CategoryProductsCubit(productsUsecase: sl()),
  );
  sl.registerFactory(
    () => MerchantProductsCubit(productsUsecase: sl()),
  );
  sl.registerFactory(
    () => AddLikeCubit(addLikeUsecase: sl()),
  );
  sl.registerFactory(
    () => ManageProductCubit(
        deleteProductUsecase: sl(), updateProductUsecase: sl()),
  );

  sl.registerFactory(
    () => ClientCheckSessionCubit(checkSessionUsecase: sl()),
  );
}
