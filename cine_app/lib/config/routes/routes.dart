import 'package:go_router/go_router.dart';
import 'package:cine_app/presentation/screens/screens.dart';
import 'package:cine_app/presentation/views/views.dart';
final appRoutes = GoRouter(
  initialLocation: "/",
  routes: [
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
      )
  ]
);