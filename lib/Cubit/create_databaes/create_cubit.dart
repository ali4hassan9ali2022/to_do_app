import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Cubit/create_databaes/create_state.dart';

class CreateCubit extends Cubit<CreateState> {
  CreateCubit() : super(CreateInitialState());

  
}