import 'package:flutter_test/flutter_test.dart';
import 'package:project_template/services/local_storage.dart';

void main() async {
  await LocalStorage.initialize();

  setUp(() {
    LocalStorage.clear();
  });

  const testKey = 'testKey';
  const testValue = 'testValue';

  group(LocalStorage, () {
    test('tests read() & write()', () {
      expect(LocalStorage.containsKey(testKey), false);
      expect(LocalStorage.read(testKey), null);

      LocalStorage.write(testKey, testValue);

      expect(LocalStorage.containsKey(testKey), true);
      expect(LocalStorage.read(testKey), testValue);
    });

    test('tests containsKey()', () {
      expect(LocalStorage.containsKey(testKey), false);

      LocalStorage.write(testKey, testValue);
      expect(LocalStorage.containsKey(testKey), true);
    });

    test('tests remove()', () {
      LocalStorage.write(testKey, testValue);
      expect(LocalStorage.read(testKey), testValue);
      expect(LocalStorage.containsKey(testKey), true);

      LocalStorage.remove(testKey);
      expect(LocalStorage.read(testKey), null);
      expect(LocalStorage.containsKey(testKey), false);
    });

    test('tests readAll()', () {
      LocalStorage.write(testKey, testValue);
      expect(LocalStorage.readAll(), {testKey: testValue});

      LocalStorage.clear();
      expect(LocalStorage.readAll(), {});
    });

    test('tests clear()', () {
      LocalStorage.write(testKey, testValue);
      expect(LocalStorage.read(testKey), testValue);
      expect(LocalStorage.containsKey(testKey), true);

      LocalStorage.clear();
      expect(LocalStorage.read(testKey), null);
      expect(LocalStorage.containsKey(testKey), false);
      expect(LocalStorage.readAll(), {});
    });
  });
}
