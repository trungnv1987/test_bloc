import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final nameProvider = StateProvider<String?>((ref) => null);
final ageProvider = StateProvider<int?>((ref) => null);
final personProvider = Provider<Person>((ref) => Person(ref: ref));

class Person {
  final Ref ref;
  Person({required this.ref});

  String? get name => ref.watch(nameProvider);
  int? get age => ref.watch(ageProvider);

  void setName(String name) {
    ref.read(nameProvider.notifier).state = name;
  }

  // void setAge(int age) {
  //   ref.read(ageProvider.notifier).state = age;
  // }
}

final class PersonConsumer extends ConsumerWidget {
  const PersonConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(personProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Name: ${person.name}, Age: ${person.age}'),
        GestureDetector(
          child: Text('Set Name'),
          onTap: () {
            final array = ['John', 'Jane', 'Jim', 'Jill'];
            final randomName = (array..shuffle()).first;
            person.setName(randomName);
          },
        ),
      ],
    );
  }
}
