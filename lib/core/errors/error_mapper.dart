import 'app_exception.dart';
import 'failure.dart';

/// Utility class to map exceptions to user-friendly failures.
class ErrorMapper {
  static Failure map(Object error) {
    if (error is AppException) {
      return _mapAppException(error);
    }
    
    // Default mapping for unknown errors
    return UnknownFailure(error.toString());
  }

  static Failure _mapAppException(AppException exception) {
    return switch (exception) {
      NetworkException() => NetworkFailure(exception.message),
      ServerException() => ServerFailure(exception.message),
      AuthException() => GeneralAuthFailure(exception.message),
      ValidationException() => ValidationFailure(exception.message),
      TimeoutException() => TimeoutFailure(exception.message),
      UnknownException() => UnknownFailure(exception.message),
    };
  }
}
