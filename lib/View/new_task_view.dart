import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubit/DataBase/database_cubit.dart';

import 'package:to_do_app/Widgets/custom_card_list_view.dart';

class NewTaskView extends StatelessWidget {
  const NewTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DatabaseCubit, DatabaseState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        List<Map> tasks = BlocProvider.of<DatabaseCubit>(context).newTasks;
        return CustomCardListView(task: tasks);
      },
    );
  }
}
