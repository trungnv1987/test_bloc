import 'package:flutter/foundation.dart';
import 'package:meta/meta_meta.dart';

sealed class Shape {}

final class Circle extends Shape {
  final double radius;
  Circle({required this.radius});
}

class Square extends Shape {
  final double side;
  Square({required this.side});
}

Iterable<int> naturalsTo(int x) sync* {
  int i = 0;
  // final a = Todo()
  while (i < x) {
    yield i++;
  }
}

interface class TodoInterface {
  void message(){
    
  }
}

abstract class Todo {
  String message() => 'Implement this function';

  @nonVirtual
  void hello() {}
}

final class TodoClass extends Todo {
  @override
  String message() => 'Implement this function';
}

@Target({TargetKind.classType})
class TodoAnnotation {
  final String message;
  const TodoAnnotation({required this.message});
}

@TodoAnnotation(message: 'Implement this function')
Iterable<int> recursiveNaturalsTo(int x) sync* {
  if (x > 0) {
    yield x;
    yield* recursiveNaturalsTo(x - 1);
  }
}

@pragma('vm:prefer-inline')
Stream<int> naturalsToStream(int x) async* {
  int i = 0;
  while (i < x) {
    yield i++;
  }
}

void printShape(Shape shape) {
  switch (shape) {
    case Circle() when shape.radius > 10:
      print('Circle with radius ${shape.radius}');
      break;
    case Circle():
      print('Circle with radius ${shape.radius}');
      break;
    case Square() when shape.side > 10:
      print('Square with side ${shape.side}');
      break;
    case Square():
      print('Square with side ${shape.side}');
      break;
  }
}
