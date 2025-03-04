import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  // API URLs
  static String get baseUrl => dotenv.env['BASE_URL'] ?? 'https://default-url.com/';
  static String get pKey => dotenv.env['PKEY'] ?? 'default_pkey';
  static String get tp => dotenv.env['TP'] ?? 'default_tp';

  // Client SignUp
  static String get clientSignUp => dotenv.env['CLIENT_SIGN_UP'] ?? 'default_path';
  static String get clientSignUpPKey => dotenv.env['CLIENT_SIGN_UP_PKEY'] ?? 'default_pkey';

  // Client SignIn
  static String get clientSignIn => dotenv.env['CLIENT_SIGN_IN'] ?? 'default_path';
  static String get clientSignInPKey => dotenv.env['CLIENT_SIGN_IN_PKEY'] ?? 'default_pkey';

  // Merchant SignUp
  static String get merchantSignUp => dotenv.env['MERCHANT_SIGN_UP'] ?? 'default_path';
  static String get merchantSignUpPKey => dotenv.env['MERCHANT_SIGN_UP_PKEY'] ?? 'default_pkey';

  // Merchant SignIn
  static String get merchantSignIn => dotenv.env['MERCHANT_SIGN_IN'] ?? 'default_path';
  static String get merchantSignInPKey => dotenv.env['MERCHANT_SIGN_IN_PKEY'] ?? 'default_pkey';

  // Home
  static String get home => dotenv.env['HOME'] ?? 'default_path';
  static String get homePKey => dotenv.env['HOME_PKEY'] ?? 'default_pkey';

  // Add Product
  static String get addProduct => dotenv.env['ADD_PRODUCT'] ?? 'default_path';
  static String get addProductPKey => dotenv.env['ADD_PRODUCT_PKEY'] ?? 'default_pkey';

  // Select Products
  static String get selectProducts => dotenv.env['SELECT_PRODUCTS'] ?? 'default_path';
  static String get selectProductsPKey => dotenv.env['SELECT_PRODUCTS_PKEY'] ?? 'default_pkey';

  // Update Products
  static String get updateProducts => dotenv.env['UPDATE_PRODUCTS'] ?? 'default_path';
  static String get updateProductsPKey => dotenv.env['UPDATE_PRODUCTS_PKEY'] ?? 'default_pkey';
  static String get updateProductsTP => dotenv.env['UPDATE_PRODUCTS_TP'] ?? 'default_pkey';

  // Delete Products
  static String get deleteProducts => dotenv.env['DELETE_PRODUCTS'] ?? 'default_path';
  static String get deleteProductsPKey => dotenv.env['DELETE_PRODUCTS_PKEY'] ?? 'default_pkey';
  static String get deleteProductsTP => dotenv.env['DELETE_PRODUCTS_TP'] ?? 'default_pkey';

  // Add Like
  static String get addLike => dotenv.env['ADD_LIKE'] ?? 'default_path';
  static String get addLikePKey => dotenv.env['ADD_LIKE_PKEY'] ?? 'default_pkey';

  // Check Like
  static String get checkLike => dotenv.env['CHECK_LIKE'] ?? 'default_path';
  static String get checkLikePKey => dotenv.env['CHECK_LIKE_PKEY'] ?? 'default_pkey';

  // Logout
  static String get logout => dotenv.env['LOGOUT'] ?? 'default_path';
  static String get logoutPKey => dotenv.env['LOGOUT_PKEY'] ?? 'default_pkey';
  static String get logoutSellerTP => dotenv.env['LOGOUT_SELLER_TP'] ?? 'default_path';
  static String get logoutCustomerTP => dotenv.env['LOGOUT_CUSTOMER_TP'] ?? 'default_pkey';

  // API Keys
  static String get status => dotenv.env['STATUS'] ?? 'default_status';
  static String get errorMessage => dotenv.env['ERROR_MESSAGE'] ?? 'default_error_message';
  static String get email => dotenv.env['EMAIL'] ?? 'default_email';
  static String get password => dotenv.env['PASSWORD'] ?? 'default_password';
  static String get token => dotenv.env['TOKEN'] ?? 'default_token';
  static String get message => dotenv.env['MESSAGE'] ?? 'default_message';
  static String get id => dotenv.env['ID'] ?? 'default_id';
  static String get name => dotenv.env['NAME'] ?? 'default_name';
  static String get phone => dotenv.env['PHONE'] ?? 'default_phone';
  static String get confirmPassword => dotenv.env['CONFIRM_PASSWORD'] ?? 'default_confirm_password';
  static String get location => dotenv.env['LOCATION'] ?? 'default_location';
}
