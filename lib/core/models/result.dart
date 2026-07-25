import '../error/failures.dart';

/// Result is a sealed class that represents the outcome of an operation.
/// It can be [Success], [Failure], or [Loading].
sealed class Result<T> {
  const Result();

  /// Returns true if the result is a [Success].
  bool get isSuccess => this is Success<T>;

  /// Returns true if the result is a [Failure].
  bool get isFailure => this is Failure<T>;

  /// Returns true if the result is [Loading].
  bool get isLoading => this is Loading<T>;

  /// Convenience method to get the data if success.
  T? get dataOrNull {
    final res = this;
    return res is Success<T> ? res.data : null;
  }

  /// Convenience method to get the failure if failure.
  FailureResult? get failureOrNull {
    final res = this;
    return res is Failure<T> ? res.failure : null;
  }
}

/// Represents a successful operation.
class Success<T> extends Result<T> {
  const Success(this.data);
  final T data;
}

/// Represents a failed operation.
class Failure<T> extends Result<T> {
  const Failure(this.failure);
  final FailureResult failure;
}

/// Represents an operation in progress.
class Loading<T> extends Result<T> {
  const Loading();
}
