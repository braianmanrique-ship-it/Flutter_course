import 'package:go_router/go_router.dart';
import 'package:form/presentation/screens.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/counter',
      builder: (context, state) => const CubitCounterScreen(),
    ),
    GoRoute(
      path: "/counter-bloc",
      builder: (context, state) => const BlocCounterScreen(),
    ),
    GoRoute(
      path: "/register",
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
