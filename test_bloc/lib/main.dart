import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/app.dart';
import 'package:flutter_infinite_list/simple_bloc_observer.dart';
import 'package:leak_tracker/leak_tracker.dart';

void main() async {
  Bloc.observer = const SimpleBlocObserver();
  LeakTracking.start();
  runApp(const App());
  
}
