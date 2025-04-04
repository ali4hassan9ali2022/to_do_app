import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubit/Theme_cubit/Theme_cubit.dart';
import 'package:to_do_app/Cubit/Theme_cubit/theme_state.dart';
import 'package:to_do_app/Cubit/cubit/database_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DatabaseCubit()..createDatabase(context),),
        BlocProvider(create: (context) => ThemeCubit(),),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.themeData,
            home: const HomeMainView(),
          );
        },
      ),
    );
  }
}
