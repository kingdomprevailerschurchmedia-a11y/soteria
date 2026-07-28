import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/entities/auth_user.dart';
import '../domain/entities/auth_status.dart';
import '../../../../core/errors/failure.dart';

part 'auth_state.freezed.dart';

/// Represents the complete UI state for authentication.
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    AuthUser? user,
    Failure? failure,
  }) = _AuthState;

  const AuthState._();

  bool get isLoading => status == AuthStatus.authenticating;
  bool get isAuthenticated => status == AuthStatus.authenticated || status == AuthStatus.guest;
  bool get isGuest => status == AuthStatus.guest;
}
