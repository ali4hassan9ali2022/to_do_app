import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/Cubit/Theme_cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(LightThemeState()) {
    loadTheme();
  }
  static final ThemeData lightTheme = ThemeData.light();
  static final ThemeData darkTheme = ThemeData.dark();

  void togglrTheme() {
   if (state is LightThemeState) {
    emit(DarkThemeState());
    saveTheme(true);
   } else {
    emit(LightThemeState());
saveTheme(false);
   }
    
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedIsDark = prefs.getBool("isDark") ?? false;
    emit(savedIsDark ? DarkThemeState() : LightThemeState());
  }

  void saveTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', isDark);
  }
}
