import 'package:flutter_riverpod/legacy.dart';
import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/presentation/movies/movie_repo.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      final fetchMoreMovies = ref.watch(movieRepoProvider).getNowPlayMovies;

      return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
    });

//callback -> es una funcion que se pasa como parametro a otra funcion
//typedef -> es un alias para un tipo de dato
typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);

    state = [...state, ...movies];
  }
}
