import 'package:flutter_infinite_list/learn/riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test Provider', () {
    test('should return the correct value', () {
      final container = ProviderContainer();
      // final name = container.read(nameProvider);
      // final age = container.read(ageProvider);
      final person = container.read(personProvider);
      person.setName('John');
      String? name() => container.read(nameProvider);
      int? age() => container.read(ageProvider);
      expect(name(), 'John');
      expect(age(), null);
      // expect(person.name, 'John');
      // expect(person.age, null);
      // tearDown(() {
      //   // container.dispose();
      // });
      container.dispose();
    });
  });
}
