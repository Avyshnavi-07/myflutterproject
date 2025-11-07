import 'package:equatable/equatable.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object?> get props => [];
}

class LoadingDetail extends DetailState {
  const LoadingDetail();
}

class FailureDetail extends DetailState {
  const FailureDetail();
}

class LoadedArticle extends DetailState {
  final Article selectedArticle;

  const LoadedArticle({required this.selectedArticle});

  @override
  List<Object?> get props => [selectedArticle];

  @override
  String toString() =>
      'LoadedArticle { source: ${selectedArticle.source?.name ?? "Unknown"} }';
}
