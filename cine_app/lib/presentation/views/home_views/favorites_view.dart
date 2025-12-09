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
    //sin favoritos
    if (favoriteMovies.isEmpty) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite_outline, size: 100, color: Colors.grey),
              Text(
                "No tienes favoritos",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Agrega tus peliculas favoritas para verlas aqui",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    //con favoritos
    return Scaffold(
      body: MovieMansory(
        movies: favoriteMovies.values.toList(),
        loadMoreMovies: () =>
            ref.read(favoriteMoviesProvider.notifier).loadFavorites(),
      ),
    );
  }
}
