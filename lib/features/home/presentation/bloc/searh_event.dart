import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchQueryChanged extends SearchEvent {
  final String query;

  const SearchQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}