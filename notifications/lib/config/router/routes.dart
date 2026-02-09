import 'package:go_router/go_router.dart';
import 'package:notifications/presentation/screens/details_screen.dart';
import 'package:notifications/presentation/screens/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: "/push-message/:pushMessageId",
      builder: (context, state) => DetailsScreen(
        pushMessageId: state.pathParameters["pushMessageId"] ?? "",
      ),
    ),
  ],
);
