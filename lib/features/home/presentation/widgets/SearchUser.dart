import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/searh_bloc.dart';
import '../bloc/searh_event.dart';
import '../bloc/searh_state.dart';

class SearchPage extends StatelessWidget {
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search with Debouncer & BLoC'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                hintText: 'Enter product name',
              ),
              onChanged: (query) {
                _debouncer.run(() {
                  context.read<SearchBloc>().add(SearchQueryChanged(query));
                });
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchInitial) {
                  return const Center(child: Text('Enter a search term'));
                } else if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchLoaded) {
                  final results = state.results;
                  return ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final product = results[index];
                      return ListTile(
                        title: Text(product.title??""),
                        subtitle: Text('\$${product}'),
                      );
                    },
                  );
                } else if (state is SearchError) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}



class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}