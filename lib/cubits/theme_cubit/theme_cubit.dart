// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  bool darkTheme = false;
  void setTheme(bool dark) {
    darkTheme = dark;
    if (darkTheme) {
      emit(ThemeDark());
    } else {
      emit(ThemeLight());
    }
  }
}
