import 'package:go_router/go_router.dart';
import 'package:cine_app/presentation/screens/screens.dart';
import 'package:cine_app/presentation/views/views.dart';

final appRoutes = GoRouter(
  initialLocation: "/",
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      routes: [
        GoRoute(
          path: "/",
          name: HomeView.name,
          builder: (context, state) => HomeView(),
          routes: [
            GoRoute(
              path: "/movie/:id",
              name: MovieScreen.name,
              builder: (context, state) =>
                  MovieScreen(movieId: state.pathParameters["id"] ?? ""),
            ),
          ],
        ),

        GoRoute(
          path: "/favorites",
          name: FavoritesView.name,
          builder: (context, state) => FavoritesView(),
        ),
      ],
    ),

    //ruta padre e hijo
    /* 
     GoRoute(
      path: "/",
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(childView: HomeView()),
    ),
    GoRoute(
      path: "/movie/:id",
      name: MovieScreen.name,
      builder: (context, state) =>
          MovieScreen(movieId: state.pathParameters["id"] ?? ""),
    ),
     */
  ],
);
