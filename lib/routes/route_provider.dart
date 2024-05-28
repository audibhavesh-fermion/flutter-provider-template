import 'package:flutter_provider_template/modules/home/home_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static var graph = GoRouter(initialLocation: "/", routes: [
    GoRoute(
      path: "/",
      name: "root",
      builder: (context, state) {
        return const HomeScreen();
      },
    )
  ]);
}
