import 'package:go_router/go_router.dart';

import '../pages/base/view.dart';

final weatherRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WeatherBaseView(),
    ),
  ],
);