import 'package:bloc/bloc.dart';
import 'package:bloc_example/app.dart';
import 'package:bloc_example/business_logic.dart';
import 'package:flutter/material.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: SimpleBlocObserver(),
  );
}
