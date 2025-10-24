import 'package:cine_app/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/config/helpers/genre_helper.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const String name = "movie-screen";

  final String movieId;

  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];
    if (movie == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _SliverAppBar(movie: movie),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _MovieDetails(movie: movie),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  final Movie movie;

  const _SliverAppBar({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      expandedHeight: size.height * 0.7,
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: const EdgeInsets.only(left: 20, bottom: 10),
        title: Text(
          movie.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.start,
        ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(movie.posterPath, fit: BoxFit.cover),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black54],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  final Movie movie;

  const _MovieDetails({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextStyles = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  width: size.width * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              /* Descripcion */
              SizedBox(
                width: (size.width - 80) * 0.7,
                child: Column(
                  children: [
                    Text(movie.title, style: TextStyles.headlineSmall),
                    Text(movie.overview, style: TextStyles.bodySmall),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        /* Generos */
        Padding(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            children: [
              ...movie.genreIds.map(
                (genreId) => Container(
                  margin: const EdgeInsets.only(right: 10, bottom: 10),
                  child: Chip(label: Text(getGenreName(genreId))),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
