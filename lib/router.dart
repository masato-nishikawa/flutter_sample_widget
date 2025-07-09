import 'package:go_router/go_router.dart';
// メインページ
import 'pages/main_page.dart';
// fl_chart 関連
import 'pages/fl_chart/p_fl_chart.dart';
import 'pages/fl_chart/p_fl_chart_line.dart';
import 'pages/fl_chart/p_fl_chart_combine.dart';
import 'pages/fl_chart/p_fl_chart_scroll.dart';
// syncfusion_flutter_charts 関連
import 'pages/syncfusion_flutter_charts/p_sfc.dart';
import 'pages/syncfusion_flutter_charts/p_sfc_line.dart';
import 'pages/syncfusion_flutter_charts/p_sfc_combine.dart';
import 'pages/syncfusion_flutter_charts/p_sfc_scroll.dart';
import 'pages/syncfusion_flutter_charts/p_sfc_sleep.dart';
// graphic 関連
import 'pages/graphic/p_graphic.dart';
import 'pages/graphic/p_graphic_line.dart';
import 'pages/graphic/p_graphic_combine.dart';
import 'pages/graphic/p_graphic_scroll.dart';
import 'pages/graphic/p_graphic_sleep.dart';

final GoRouter router = GoRouter(
  routes: [
    // メインページ
    GoRoute(path: '/', builder: (context, state) => const MainPage()),
    // fl_chart
    GoRoute(
      path: '/fl_chart',
      builder:
          (context, state) =>
              PageFl(title: state.extra as String? ?? 'fl_chart'),
    ),
    GoRoute(
      path: '/fl_chart/line',
      builder:
          (context, state) =>
              PageFlLine(title: state.extra as String? ?? 'fl_chart_line'),
    ),
    GoRoute(
      path: '/fl_chart/combine',
      builder:
          (context, state) => PageFlCombine(
            title: state.extra as String? ?? 'fl_chart_combine',
          ),
    ),
    GoRoute(
      path: '/fl_chart/scroll',
      builder:
          (context, state) =>
              PageFlScroll(title: state.extra as String? ?? 'fl_chart_scroll'),
    ),
    // syncfusion_flutter_charts
    GoRoute(
      path: '/sfc',
      builder:
          (context, state) => PageSfc(title: state.extra as String? ?? 'sfc'),
    ),
    GoRoute(
      path: '/sfc/line',
      builder:
          (context, state) =>
              PageSfcLine(title: state.extra as String? ?? 'sfc_line'),
    ),
    GoRoute(
      path: '/sfc/combine',
      builder:
          (context, state) =>
              PageSfcCombine(title: state.extra as String? ?? 'sfc_combine'),
    ),
    GoRoute(
      path: '/sfc/scroll',
      builder:
          (context, state) =>
              PageSfcScroll(title: state.extra as String? ?? 'sfc_scroll'),
    ),
    GoRoute(
      path: '/sfc/sleep',
      builder:
          (context, state) =>
              PageSfcSleep(title: state.extra as String? ?? 'sfc_sleep'),
    ),
    // graphic
    GoRoute(
      path: '/graphic',
      builder:
          (context, state) =>
              PageGraphic(title: state.extra as String? ?? 'graphic'),
    ),
    GoRoute(
      path: '/graphic/line',
      builder:
          (context, state) =>
              PageGraphicLine(title: state.extra as String? ?? 'graphic_line'),
    ),
    GoRoute(
      path: '/graphic/combine',
      builder:
          (context, state) => PageGraphicCombine(
            title: state.extra as String? ?? 'graphic_combine',
          ),
    ),
    GoRoute(
      path: '/graphic/scroll',
      builder:
          (context, state) => PageGraphicLineScroll(
            title: state.extra as String? ?? 'graphic_scroll',
          ),
    ),
    GoRoute(
      path: '/graphic/sleep',
      builder:
          (context, state) => PageGraphicBarSleep(
            title: state.extra as String? ?? 'graphic_sleep',
          ),
    ),
  ],
);
