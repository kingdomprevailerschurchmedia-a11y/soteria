import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'logger.dart';

/// Provider for the central [SoteriaLogger].
final loggerProvider = Provider<SoteriaLogger>((ref) {
  return SoteriaLogger();
});
