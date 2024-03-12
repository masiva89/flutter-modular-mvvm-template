import 'package:gen/gen.dart';
import 'package:flutter_modular_mvvm/product/service/interface/operation_base.dart';

/// An abstract class that defines the operations related to authentication.
abstract class AuthenticationOperation extends OperationBase {
  /// Retrieves a list of users.
  Future<List<User>> users();

  /// Logs in a user with the provided credentials and firebase token.
  ///
  /// Returns a [ProductUser] object representing the logged-in user.
  Future<ProductUser> login({
    required String username,
    required String password,
    required String firebaseToken,
  });

  /// Signs up a new user with the provided credentials and agreement.
  ///
  /// Returns a [BaseResponseModel] object representing the response.
  Future<BaseResponseModel> signUp({
    required String username,
    required String password,
    required String email,
    required String passwordConfirmation,
    required int agreement,
  });
}
