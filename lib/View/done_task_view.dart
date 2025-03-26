import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubit/cubit/database_cubit.dart';

import 'package:to_do_app/Widgets/custom_card_list_view.dart';

class DoneTaskView extends StatelessWidget {
  const DoneTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DatabaseCubit, DatabaseState>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = BlocProvider.of<DatabaseCubit>(context).doneTasks;
        return CustomCardListView(task: tasks);
      },
    );
  }
}
