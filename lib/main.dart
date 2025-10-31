import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/app.dart';
import 'package:flutter_infinite_list/learn/riverpod/riverpod.dart';
import 'package:flutter_infinite_list/learn/state/provider/provider.dart';
import 'package:flutter_infinite_list/simple_bloc_observer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leak_tracker/leak_tracker.dart';

void main() async {
  Bloc.observer = const SimpleBlocObserver();
  LeakTracking.start();
  // runApp(const App());
  // runApp(MaterialApp(home: TestProvider()));
  runApp(
    MaterialApp(
      home: ProviderScope(
        child: Scaffold(body: Center(child: PersonConsumer())),
      ),
    ),
  );
}
