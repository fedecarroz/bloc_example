import 'package:bloc_example/business_logic.dart';
import 'package:bloc_example/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(),
        child: HomePage(),
      ),
    );
  }
}
