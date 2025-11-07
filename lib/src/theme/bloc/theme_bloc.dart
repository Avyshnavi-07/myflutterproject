import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/theme/bloc/theme_event.dart';
import 'package:flutter_news_app/src/theme/bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(SelectedTheme(themeType: ThemeType.Light)) {
    on<LightMode>((event, emit) {
      emit(SelectedTheme(themeType: ThemeType.Light));
    });

    on<DarkMode>((event, emit) {
      emit(SelectedTheme(themeType: ThemeType.Dark));
    });
  }
}
