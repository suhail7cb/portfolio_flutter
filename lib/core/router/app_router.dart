import 'package:go_router/go_router.dart';
import 'package:portfolio_flutter/features/portfolio/presentation/pages/portfolio_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const PortfolioPage(),
      ),
    ],
  );
}