import 'package:flutter_infinite_list/learn/extension_type/extension_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test NumberE', () {
    final number = NumberE(10);
    expect(number.double, 20);
    expect(number + NumberE(10), NumberE(20));
  });
}
