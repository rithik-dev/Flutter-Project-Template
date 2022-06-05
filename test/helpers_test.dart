import 'package:flutter_test/flutter_test.dart';
import 'package:project_template/utils/helpers.dart';

void main() async {
  group('tests capitalizeFirst()', () {
    test('tests for empty string', () {
      expect(capitalizeFirst(''), '');
    });

    test('tests for single character', () {
      expect(capitalizeFirst('a'), 'A');
      expect(capitalizeFirst('A'), 'A');
    });

    test('tests for one word', () {
      expect(capitalizeFirst('hello'), 'Hello');
      expect(capitalizeFirst('Hello'), 'Hello');
    });

    test('tests for more than one word', () {
      expect(capitalizeFirst('hello world'), 'Hello world');
      expect(capitalizeFirst('Hello world'), 'Hello world');
    });
  });

  group('tests isNullOrBlank()', () {
    test('tests for null', () {
      expect(isNullOrBlank(null), true);
    });

    test('tests for empty string', () {
      expect(isNullOrBlank(''), true);
    });

    test('tests for "test" string', () {
      expect(isNullOrBlank('test'), false);
    });
  });
}
