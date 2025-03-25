import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/Cubit/create_databaes/create_state.dart';
import 'package:to_do_app/View/archived_task_view.dart';
import 'package:to_do_app/View/done_task_view.dart';
import 'package:to_do_app/View/new_task_view.dart';

class AppCubit extends Cubit<AppState> {
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];
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
  Database? database;
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavbar());
  }

  void changeBottomSheet({required bool isShow, required IconData icon}) {
    isChecked = isShow;
    iconData = icon;
    emit(AppChangeBottomSheetChange());
  }

  void createDatabase() {
    if(database != null) {
      openDatabase(
      "todolist.db",
      version: 1,
      onCreate: (db, version) {
        print('databasecreated');
        db
            .execute(
              "CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date, TEXT, time TEXT, status TEXT)",
            )
            .then((value) {
              print('Table created');
            })
            .catchError((error) {
              print('Error: ${error.toString()}');
            });
      },
      onOpen: (db) {
        getData(database);
        print('databaseopened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabase());
    });
    }
  }
  

  void inserttoDataBase({
    required TextEditingController title,
    required TextEditingController time,
    required TextEditingController date,
  }) async{
    if(database != null) {
      await database
        ?.transaction((txn) async {
          txn.rawInsert(
            'INSERT INTO tasks (title, date, time, status) VALUES("${title.text}", "${date.text}", "${time.text}", "new")',
          );
        })
        .then((value) {
          print('$value inserted successfully');
          emit(AppInsertDatabase());
          getData(database);
        });
    } else {
      print("Error");
    }
  }

  void getData(db) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(AppGetDatabaseLoadingState());
    database!.rawQuery('SELECT * FROM tasks').then((value) {
      for (var element in value) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archivedTasks.add(element);
        }
      }
      emit(AppGetDatabase());
    });
  }
  void updateDatabase({
    required String status,
    required int id,
  }) {
    database!.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        [status, '$id']).then((value) {
      getData(database);
      emit(AppUpdateDatabase());
    });
  }
}
