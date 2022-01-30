import 'package:flutter/material.dart';
import 'package:flutter_auth/states/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './ui/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: const Home(),
      ),
    );
  }
}
