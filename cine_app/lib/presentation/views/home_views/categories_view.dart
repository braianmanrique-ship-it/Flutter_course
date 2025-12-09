import 'package:cine_app/presentation/widgets/movies/movie_mansory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cine_app/presentation/providers/providers.dart';

class CategoriesView extends ConsumerStatefulWidget {
  static const String name = "categories-view";

  const CategoriesView({super.key});

  @override
  ConsumerState<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends ConsumerState<CategoriesView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    if (upcomingMovies.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: Container(
        child: MovieMansory(
          movies: upcomingMovies,
          loadMoreMovies: () async {
            await ref.read(upcomingMoviesProvider.notifier).loadNextPage();
            return ref.read(upcomingMoviesProvider);
          },
        ),
      ),
    );
  }
}
