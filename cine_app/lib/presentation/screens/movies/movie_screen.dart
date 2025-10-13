import 'package:cine_app/presentation/providers/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cine_app/domain/entities/movie.dart';

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
    if(movie == null){
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(body: Center(child: Text('Movie Id: ${widget.movieId}')));
  }
}
