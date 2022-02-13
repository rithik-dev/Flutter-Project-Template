import 'package:flutter_test/flutter_test.dart';
import 'package:project_template/utils/helpers.dart';

void main() {
  test('Check capitalize function', () {
    expect('Hello', capitalize('hello'));
    expect('Hello', capitalize('Hello'));
  });

  test('Check isNullOrBlank function', () {
    expect(true, isNullOrBlank(null));
    expect(true, isNullOrBlank(''));
    expect(false, isNullOrBlank('test'));
  });
}
