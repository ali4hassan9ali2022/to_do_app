import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/View/archived_task_view.dart';
import 'package:to_do_app/View/done_task_view.dart';
import 'package:to_do_app/View/new_task_view.dart';

part 'database_state.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(DatabaseInitial());
   bool isDark = false;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];
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

  void createDatabase(BuildContext context) {
    openDatabase(
      "todo.db",
      version: 1,
      onCreate: (db, version) async {
        print('databasecreated');
        if (database != null) {
          await db
              .execute(
                "CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)",
              )
              .then((value) {
                print('Table created');
              })
              .catchError((error) {
                print('Error: ${error.toString()}');
              });
        } else {
          print("Database is not");
        }
      },
      onOpen: (db) {
        getDataFromDatabase(db);
        print('databaseopened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabase());
    });
  }

  insertToDatabase({
    required TextEditingController title,
    required TextEditingController time,
    required TextEditingController date,
  }) async {
    await database!
        .transaction((txn) async {
          txn.rawInsert(
            'INSERT INTO tasks(title, date, time, status) VALUES("${title.text}", "${date.text}", "${time.text}", "new")',
          );
        })
        .then((value) {
          print('$value inserted successfully');
          emit(AppInsertDatabase());
          getDataFromDatabase(database);
        });
  }

  getDataFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
          print(newTasks);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archivedTasks.add(element);
        }
      });
      emit(AppGetDatabase());
    });
  }

  void updateData({required String status, required int id}) {
    database!
        .rawUpdate('UPDATE tasks SET status = ? WHERE id = ?', [status, '$id'])
        .then((value) {
          getDataFromDatabase(database);
          emit(AppUpdateDatabase());
        });
  }

  void deleteData({required int id}) {
    database!
        .rawDelete('DELETE FROM tasks WHERE id = ?', ['$id'])
        .then((value) {
          getDataFromDatabase(database);
          emit(AppDeleteDatabase());
        });
  }

 

  void changeTheme() {
    isDark = !isDark;
    emit(AppChangeThemeState());
  }
}
