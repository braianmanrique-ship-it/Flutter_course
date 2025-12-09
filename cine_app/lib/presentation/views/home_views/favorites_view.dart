import 'package:cine_app/presentation/providers/storage/favorite_movies_provider.dart';
import 'package:cine_app/presentation/widgets/movies/movie_mansory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  static const String name = "favorites-view";

  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    ref.read(favoriteMoviesProvider.notifier).loadFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider);

    return Scaffold(
      body: MovieMansory(
        movies: favoriteMovies.values.toList(),
        loadMoreMovies: () =>
            ref.read(favoriteMoviesProvider.notifier).loadFavorites(),
      ),
    );
  }
}
