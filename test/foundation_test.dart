import 'package:flutter_test/flutter_test.dart';
import 'package:soteria/core/design_system/design_system.dart';
import 'package:soteria/core/models/result.dart';
import 'package:soteria/core/errors/failure.dart';

void main() {
  group('Foundation - Design System', () {
    test('Tokens should have valid values', () {
      expect(SoteriaSpacing.s16, equals(16.0));
      expect(SoteriaRadius.m, equals(12.0));
      expect(SoteriaColors.primaryLight, isNotNull);
      expect(SoteriaColors.coinGold, isNotNull);
    });
  });

  group('Foundation - Result Pattern', () {
    test('Success should hold data', () {
      const result = Success<String>('Test');
      expect(result.data, equals('Test'));
      expect(result.isSuccess, isTrue);
    });

    test('Error should hold failure', () {
      const failure = NetworkFailure('No Internet');
      const result = Error<String>(failure);
      expect(result.failure, equals(failure));
      expect(result.isFailure, isTrue);
    });

    test('when() should switch correctly', () {
      const result = Success<int>(42);
      final value = result.when(
        data: (d) => d,
        error: (f, s) => 0,
        loading: () => -1,
      );
      expect(value, equals(42));
    });
  });
}
