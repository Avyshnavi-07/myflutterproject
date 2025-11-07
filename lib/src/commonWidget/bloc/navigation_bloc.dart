import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/commonWidget/bloc/navigation_event.dart';
import 'package:flutter_news_app/src/commonWidget/bloc/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(Opened(pageIndex: 0)) {
    on<Navigate>((event, emit) {
      emit(Opened(pageIndex: event.pageIndex));
    });
  }
}
