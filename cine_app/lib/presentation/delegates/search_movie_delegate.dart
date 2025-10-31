import 'package:flutter/material.dart';
import 'package:cine_app/domain/entities/movie.dart';

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  @override
  String get searchFieldLabel => "Busca tu pelicula";

  @override
  List<Widget>? buildActions(BuildContext context) {
    debugPrint(query);
    if (query.isEmpty) return null;
    return [
      IconButton(onPressed: () => query = "", icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => {close(context, null)},
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("results");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text("suggestions");
  }
}
