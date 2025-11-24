import 'package:flutter/material.dart';
import 'package:cine_app/config/theme/app_theme.dart';
import 'package:cine_app/config/routes/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//bdd
import 'package:drift/drift.dart';
import 'package:cine_app/config/database/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /*     await db
      .into(db.favoritesMovies)
      .insert(
        FavoritesMoviesCompanion.insert(
          movieId: 2,
          backdropPath:
              "https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg",
          originalTitle: "The Dark Knight",
          posterPath:
              "https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg",
          title: "The Dark Knight",
          voteAverage: Value(8.5),
        ),
      ); */

/*   final deleQuery = await db.delete(db.favoritesMovies).go();
  print("deleQuery: $deleQuery");

  final movieQuery = await db.select(db.favoritesMovies).get();
  print("movieQuery: $movieQuery"); */

  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRoutes,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      title: "Cine App",
    );
  }
}
