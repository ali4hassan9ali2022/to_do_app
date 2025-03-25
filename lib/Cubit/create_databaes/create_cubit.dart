import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubit/create_databaes/create_state.dart';
import 'package:to_do_app/View/archived_task_view.dart';
import 'package:to_do_app/View/done_task_view.dart';
import 'package:to_do_app/View/new_task_view.dart';

class CreateCubit extends Cubit<CreateState> {
  CreateCubit() : super(CreateInitialState());
  int currentIndex = 0;
  List<Widget> pages = [
    const NewTaskView(),
    const DoneTaskView(),
    const ArchivedTaskView(),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavbar());
  }
}
