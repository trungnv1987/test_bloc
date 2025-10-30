import 'package:flutter_infinite_list/learn/branches/branches.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:collection/collection.dart';

void main() {
  group('Shape', () {
    test('Circle with radius 10', () {
      // expect(Circle(radius: 10).radius, 10);
      assert(Circle(radius: 10).radius >= 10);
    });
    test('test naturalsTo', () {
      final arr = naturalsTo(5).toList();
      final checkedList = [0, 1, 2, 3, 4];
      const equality = ListEquality<int>();
      expect(equality.equals(arr, checkedList), true);
    });

    test('test naturalsToStream', () async {
      final stream = naturalsToStream(5);
      final checkedList = [0, 1, 2, 3, 4];
      const equality = ListEquality<int>();
      // stream.listen((event) {
      //   print('event: $event');
      // });
      final list = await stream.toList();
      print('list: $list');
      expect(equality.equals(list, checkedList), true);
    });

    test('test recursiveNaturalsTo', () {
      final arr = recursiveNaturalsTo(5).toList();
      print('arr: $arr');
      final checkedList = [1, 2, 3, 4, 5];
      const equality = UnorderedIterableEquality<int>();
      expect(equality.equals(arr, checkedList), true);
    });
  });
}
