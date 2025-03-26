part of 'database_cubit.dart';

@immutable
sealed class DatabaseState {}

final class DatabaseInitial extends DatabaseState {}
class AppChangeBottomSheetChange extends DatabaseState{}
class AppChangeBottomNavbar extends DatabaseState{}
class AppCreateDatabase extends DatabaseState{}
class AppGetDatabaseLoadingState extends DatabaseState{}
class AppGetDatabase extends DatabaseState{}
class AppInsertDatabase extends DatabaseState{}
class AppUpdateDatabase extends DatabaseState{}
class AppDeleteDatabase extends DatabaseState{}
