import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubit/create_databaes/create_state.dart';
import 'package:to_do_app/View/archived_task_view.dart';
import 'package:to_do_app/View/done_task_view.dart';
import 'package:to_do_app/View/new_task_view.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> keyState = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int currentIndex = 0;
  bool isChecked = false;
  IconData iconData = Icons.edit;
  List<String> titlePages = ["New Task", "Done Task", "Archived Task"];
  List<Widget> pages = [
    const NewTaskView(),
    const DoneTaskView(),
    const ArchivedTaskView(),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavbar());
  }

  void changeBottomSheet({required bool isShow, required IconData icon}) {
    isChecked = isShow;
    iconData = icon;
    emit(AppChangeBottomSheetChange());
  }
}
