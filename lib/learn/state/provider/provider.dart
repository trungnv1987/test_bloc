import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../branches/branches.dart';

final class TestNotifier extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

final class Test2Object {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
  }
}

final class TestProvider extends StatelessWidget {
  const TestProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<TestNotifier>(create: (_) => TestNotifier()),
          Provider(create: (_) => Test2Object()),
        ],
        child: Center(child: const TestView()),
      ),
    );
  }
}

final testStreamProvider = StreamProvider<int>(
  create: (_) => naturalsToStream(100),
  initialData: 0,
);

final class TestStreamProvider extends StatelessWidget {
  const TestStreamProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [testStreamProvider],
      child: const TestStreamView(),
    );
  }
}

final class TestStreamView extends StatelessWidget {
  const TestStreamView({super.key});

  @override
  Widget build(BuildContext context) {
    
    final value = context.watch<int>();
    return Text('Value: ${value}');
  }
}

final class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TestStreamProvider(),
        Selector<TestNotifier, int>(
          selector: (context, testNotifier) => testNotifier.count,
          builder: (context, count, child) {
            return Text('Count: $count');
          },
        ),
        Consumer<TestNotifier>(
          builder: (context, notifier, child) {
            return GestureDetector(
              onTap: () {
                final test2Object = context.read<Test2Object>();
                notifier.increment();
              },
              child: Text('Count: ${notifier.count}'),
            );
          },
        ),
      ],
    );
  }
}
