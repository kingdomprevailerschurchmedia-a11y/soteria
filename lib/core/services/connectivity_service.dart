import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ConnectivityStatus defines the current state of internet connection.
enum ConnectivityStatus {
  online,
  offline,
  weak,
  unknown,
}

/// ConnectivityService monitors the device's network connection.
class ConnectivityService {
  ConnectivityService(this._connectivity);
  final Connectivity _connectivity;

  /// Stream of connectivity status changes.
  Stream<ConnectivityStatus> get onStatusChanged =>
      _connectivity.onConnectivityChanged.map(_mapToStatus);

  /// Returns the current connectivity status.
  Future<ConnectivityStatus> checkStatus() async {
    final result = await _connectivity.checkConnectivity();
    return _mapToStatus(result);
  }

  ConnectivityStatus _mapToStatus(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none)) {
      return ConnectivityStatus.offline;
    }
    if (results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.ethernet)) {
      return ConnectivityStatus.online;
    }
    return ConnectivityStatus.unknown;
  }
}

/// Provider for the [ConnectivityService].
final connectivityServiceProvider = Provider<ConnectivityService>((ref) {
  return ConnectivityService(Connectivity());
});

/// Provider for the current [ConnectivityStatus].
final connectivityStatusProvider = StreamProvider<ConnectivityStatus>((ref) {
  final service = ref.watch(connectivityServiceProvider);
  return service.onStatusChanged;
});
