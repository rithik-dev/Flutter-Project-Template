import 'package:flutter_test/flutter_test.dart';
import 'package:project_template/utils/helpers.dart';

void main() {
  test('Check capitalize function', () {
    expect(capitalizeFirst(''), '');
    expect(capitalizeFirst('a'), 'A');
    expect(capitalizeFirst('hello'), 'Hello');
    expect(capitalizeFirst('Hello'), 'Hello');
  });

  test('Check isNullOrBlank function', () {
    expect(isNullOrBlank(null), true);
    expect(isNullOrBlank(''), true);
    expect(isNullOrBlank('test'), false);
  });
}
