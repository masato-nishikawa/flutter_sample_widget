import 'package:go_router/go_router.dart';

import 'pages/main_page.dart';
import 'pages/page_a.dart';
import 'pages/page_b.dart';
import 'pages/page_c.dart';
import 'pages/page_d.dart';
import 'pages/page_e.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MainPage()),
    GoRoute(
      path: '/a',
      builder: (context, state) {
        final title = state.extra as String? ?? 'Page A';
        return PageA(title: title);
      },
    ),
    GoRoute(
      path: '/b',
      builder: (context, state) {
        final title = state.extra as String? ?? 'Page B';
        return PageB(title: title);
      },
    ),
    GoRoute(
      path: '/c',
      builder: (context, state) {
        final title = state.extra as String? ?? 'Page C';
        return PageC(title: title);
      },
    ),
    GoRoute(
      path: '/d',
      builder: (context, state) {
        final title = state.extra as String? ?? 'Page D';
        return PageD(title: title);
      },
    ),
    GoRoute(
      path: '/e',
      builder: (context, state) {
        final title = state.extra as String? ?? 'Page E';
        return PageE(title: title);
      },
    ),
  ],
);
