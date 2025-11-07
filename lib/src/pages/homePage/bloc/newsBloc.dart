import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/resources/repository.dart';
import 'newsEvent.dart';
import 'newsState.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final Repository repository;

  NewsBloc({required this.repository}) : super(Loading()) {
    on<Fetch>(_onFetch);
  }

  Future<void> _onFetch(Fetch event, Emitter<NewsState> emit) async {
    try {
      emit(Loading());
      final items = await repository.fetchAllNews(category: event.type);
      emit(Loaded(items: items, type: event.type));
    } catch (error, stackTrace) {
      log("Error fetching news", error: error, stackTrace: stackTrace);
      emit(Failure());
    }
  }
}
