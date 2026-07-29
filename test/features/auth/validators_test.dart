import 'package:flutter_test/flutter_test.dart';
import 'package:soteria/core/utils/validators.dart';

void main() {
  group('Validators - Email', () {
    test('should return error if email is empty', () {
      expect(Validators.email(''), 'Email is required');
      expect(Validators.email(null), 'Email is required');
    });

    test('should return error if email is invalid', () {
      expect(Validators.email('invalid-email'), 'Enter a valid email address');
      expect(Validators.email('name@domain'), 'Enter a valid email address');
    });

    test('should return null if email is valid', () {
      expect(Validators.email('scholar@soteria.app'), isNull);
    });
  });

  group('Validators - Password', () {
    test('should return error if password is empty', () {
      expect(Validators.password(''), 'Password is required');
    });

    test('should return error if password is too short', () {
      expect(Validators.password('Pass1!'), 'Password must be at least 8 characters');
    });

    test('should return error if missing uppercase', () {
      expect(Validators.password('password123!'), 'Must contain an uppercase letter');
    });

    test('should return error if missing lowercase', () {
      expect(Validators.password('PASSWORD123!'), 'Must contain a lowercase letter');
    });

    test('should return error if missing number', () {
      expect(Validators.password('Password!'), 'Must contain a number');
    });

    test('should return error if missing special character', () {
      expect(Validators.password('Password123'), 'Must contain a special character');
    });

    test('should return null if password is strong', () {
      expect(Validators.password('Scholar123!'), isNull);
    });
  });

  group('Validators - Username', () {
    test('should return error if username is too short', () {
      expect(Validators.username('ab'), 'Username must be at least 3 characters');
    });

    test('should return error if username contains invalid characters', () {
      expect(Validators.username('user@name'), 'Only letters, numbers, and underscores allowed');
    });

    test('should return null if username is valid', () {
      expect(Validators.username('scholar_hero'), isNull);
    });
  });
}
