import '../errors/failure.dart';

/// Result is a sealed class that represents the outcome of an operation.
/// It can be [Success], [Error], or [Loading].
sealed class Result<T> {
  const Result();

  /// Returns true if the result is a [Success].
  bool get isSuccess => this is Success<T>;

  /// Returns true if the result is an [Error].
  bool get isFailure => this is Error<T>;

  /// Returns true if the result is [Loading].
  bool get isLoading => this is Loading<T>;

  /// Convenience method to get the data if success.
  T? get dataOrNull {
    final res = this;
    return res is Success<T> ? res.data : null;
  }

  /// Convenience method to get the failure if failure.
  Failure? get failureOrNull {
    final res = this;
    return res is Error<T> ? res.failure : null;
  }

  /// Pattern matching for the result states.
  R when<R>({
    required R Function(T data) data,
    required R Function(Failure failure, StackTrace? stackTrace) error,
    required R Function() loading,
  }) {
    final res = this;
    if (res is Success<T>) return data(res.data);
    if (res is Error<T>) return error(res.failure, null);
    return loading();
  }
}

/// Represents a successful operation.
class Success<T> extends Result<T> {
  const Success(this.data);
  final T data;
}

/// Represents a failed operation.
/// Renamed from Failure to Error to avoid conflict with the Failure entity.
class Error<T> extends Result<T> {
  const Error(this.failure);
  final Failure failure;
}

/// Represents an operation in progress.
class Loading<T> extends Result<T> {
  const Loading();
}
