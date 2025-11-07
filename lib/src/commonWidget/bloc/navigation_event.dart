import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class Navigate extends NavigationEvent {
  final int pageIndex;

  const Navigate({required this.pageIndex});

  @override
  List<Object> get props => [pageIndex];
}
