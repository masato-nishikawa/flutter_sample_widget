import 'package:flutter_sample_widget/pages/page_sfc_combine.dart';
import 'package:go_router/go_router.dart';

import 'pages/main_page.dart';
import 'pages/page_fl_chart.dart';
import 'pages/page_fl_chart_line.dart';
import 'pages/page_fl_chart_combine.dart';
import 'pages/page_sfc.dart';
import 'pages/page_sfc_line.dart';
import 'pages/page_graphic.dart';
import 'pages/page_graphic_line.dart';
import 'pages/page_graphic_combine.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MainPage()),
    GoRoute(
      path: '/fl_chart',
      builder: (context, state) {
        final title = state.extra as String? ?? 'fl_chart';
        return PageFl(title: title);
      },
    ),
    GoRoute(
      path: '/fl_chart/line',
      builder: (context, state) {
        final title = state.extra as String? ?? 'fl_chart';
        return PageFlLine(title: title);
      },
    ),
    GoRoute(
      path: '/fl_chart/combine',
      builder: (context, state) {
        final title = state.extra as String? ?? 'fl_chart';
        return PageFlCombine(title: title);
      },
    ),
    GoRoute(
      path: '/sfc',
      builder: (context, state) {
        final title = state.extra as String? ?? 'sfc';
        return PageSfc(title: title);
      },
    ),
    GoRoute(
      path: '/sfc/line',
      builder: (context, state) {
        final title = state.extra as String? ?? 'sfc_line';
        return PageSfcLine(title: title);
      },
    ),
    GoRoute(
      path: '/sfc/combine',
      builder: (context, state) {
        final title = state.extra as String? ?? 'sfc_combine';
        return PageSfcCombine(title: title);
      },
    ),
    GoRoute(
      path: '/graphic',
      builder: (context, state) {
        final title = state.extra as String? ?? 'graphic';
        return PageGraphic(title: title);
      },
    ),
    GoRoute(
      path: '/graphic/line',
      builder: (context, state) {
        final title = state.extra as String? ?? 'graphic_line';
        return PageGraphicLine(title: title);
      },
    ),
    GoRoute(
      path: '/graphic/combine',
      builder: (context, state) {
        final title = state.extra as String? ?? 'graphic_combine';
        return PageGraphicCombine(title: title);
      },
    ),
  ],
);
