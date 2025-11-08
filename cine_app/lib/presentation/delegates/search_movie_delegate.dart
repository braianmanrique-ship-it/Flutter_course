import 'package:flutter/material.dart';
import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/config/helpers/numformat.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate({required this.searchMovies});

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
    return FutureBuilder(
      future: searchMovies(query),
      initialData: const [],
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return MovieItem(
              movie: movie,
              movieSelected: () => close(context, movie),
            );
          },
        );
      },
    );
  }
}

class MovieItem extends StatelessWidget {
  final Movie movie;
  final Function movieSelected;

  const MovieItem({
    super.key,
    required this.movie,
    required this.movieSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => movieSelected(),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            /* poster */
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(movie.posterPath),
                width: size.width * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            /* title and overview */
            SizedBox(
              width: (size.width - 80) * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* title */
                  Text(movie.title, style: textStyles.titleMedium),
                  /* overview */
                  (movie.overview.length > 100)
                      ? Text("${movie.overview.substring(0, 100)}...")
                      : Text(movie.overview),
                  /* rating */
                  Row(
                    children: [
                      Icon(
                        Icons.star_half_rounded,
                        color: Colors.yellow.shade700,
                      ),
                      Text(
                        Numformat.number(movie.popularity),
                        style: textStyles.bodySmall?.copyWith(
                          color: Colors.yellow.shade700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
