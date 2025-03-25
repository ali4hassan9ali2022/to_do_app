import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubit/create_databaes/create_cubit.dart';
import 'package:to_do_app/View/new_task_view.dart';
import 'package:to_do_app/Widgets/custom_bottom_nav_bar.dart';

class HomeMainView extends StatelessWidget {
  const HomeMainView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CreateCubit>(context); 
    return Scaffold(
      appBar: AppBar(title: const Text("New Tasks")),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: cubit.currentIndex,
      ),
      body: const NewTaskView(),
    );
  }
}


