import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubit/create_databaes/create_cubit.dart';
import 'package:to_do_app/Main/home_main_view.dart';
import 'package:to_do_app/simple_bloc_opserver.dart';

void main() {
  Bloc.observer = SimpleBlocOpserver();
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: const MaterialApp(home: HomeMainView()),
    );
  }
}
