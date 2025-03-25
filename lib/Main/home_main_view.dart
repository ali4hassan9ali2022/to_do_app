import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubit/create_databaes/create_cubit.dart';
import 'package:to_do_app/Cubit/create_databaes/create_state.dart';
import 'package:to_do_app/Widgets/custom_bottom_nav_bar.dart';
import 'package:to_do_app/Widgets/custom_show_bottom_sheet.dart';

class HomeMainView extends StatelessWidget {
  const HomeMainView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CreateCubit>(context);
    return BlocConsumer<CreateCubit, CreateState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            onPressed: () {
              cubit.scaffoldKey.currentState!.showBottomSheet((context) {
                return CustomShowBottomSheet(cubit: cubit);
              });
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
          key: cubit.scaffoldKey,
          appBar: AppBar(title: Text(cubit.titlePages[cubit.currentIndex])),
          bottomNavigationBar: CustomBottomNavBar(
            onTap: (value) {
              cubit.changeIndex(value);
            },
            currentIndex: cubit.currentIndex,
          ),
          body: cubit.pages[cubit.currentIndex],
        );
      },
    );
  }
}
