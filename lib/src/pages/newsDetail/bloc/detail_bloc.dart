import 'package:flutter_bloc/flutter_bloc.dart';
import 'detail_event.dart';
import 'detail_state.dart';

class DetailBloc extends Bloc<NewsDetailEvent, DetailState> {
  DetailBloc() : super(LoadingDetail()) {
    // Handle SelectNewsForDetail event
    on<SelectNewsForDetail>((event, emit) {
      try {
        emit(LoadedArticle(selectedArticle: event.article));
      } catch (_) {
        emit(FailureDetail());
      }
    });
  }
}
