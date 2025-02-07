import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop/features/home/presentation/bloc/searh_event.dart';
import 'package:ishop/features/home/presentation/bloc/searh_state.dart';
import 'package:ishop/features/home/presentation/widgets/SearchUser.dart';

// BLoC
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  SearchBloc() : super(SearchInitial()) {
    on<SearchQueryChanged>(_onSearchTextChanged);
  }

  void _onSearchTextChanged(SearchQueryChanged event, Emitter<SearchState> emit) async {
    final query = event.query;

    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    _debouncer.run(() async {
      try {
        // Simulate a search operation (e.g., API call)
        await Future.delayed(Duration(seconds: 1)); // Simulate network delay
        final results = await _performSearch(query);
        emit(SearchLoaded(results));
      } catch (e) {
        emit(SearchError('Failed to load results'));
      }
    });
  }

  Future<List<String>> _performSearch(String query) async {
    // Simulate a search operation
    final List<String> allItems = ["Apple", "Banana", "Cherry", "Date", "Fig", "Grape"];
    return allItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}