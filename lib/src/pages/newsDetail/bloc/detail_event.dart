import 'package:equatable/equatable.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';

abstract class NewsDetailEvent extends Equatable {
  const NewsDetailEvent();

  @override
  List<Object?> get props => [];
}

class SelectNewsForDetail extends NewsDetailEvent {
  final Article article;

  const SelectNewsForDetail({required this.article});

  @override
  List<Object?> get props => [article];

  @override
  String toString() => 'SelectNewsForDetail { Title: ${article.title} }';
}

class SelectNewsForDetailed extends NewsDetailEvent {
  final Article article;

  const SelectNewsForDetailed({required this.article});

  @override
  List<Object?> get props => [article];

  @override
  String toString() => 'SelectNewsForDetailed { Title: ${article.title} }';
}
