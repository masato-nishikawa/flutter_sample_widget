import 'package:flutter/material.dart';
import 'package:flutter_sample_widget/theme/app_colors.dart';
import 'package:flutter_sample_widget/utils/color_extention.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('メインページ'),
        backgroundColor: appColorMap['Mirallel Blue']!.toColor(),
      ),
      backgroundColor: appColorMap['Mirallel Light Sky Blue']!.toColor(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              _buildChartCategory(
                title: 'fl_chart',
                routes: {
                  'fl_chart': '/fl_chart',
                  'fl_chart_line': '/fl_chart/line',
                  'fl_chart_combine': '/fl_chart/combine',
                  'fl_chart_scroll': '/fl_chart/scroll',
                  'fl_chart_sleep': '/fl_chart/sleep',
                  'fl_chart_radar': '/fl_chart/radar',
                },
                context: context,
              ),
              _buildChartCategory(
                title: 'syncfusion_flutter_charts',
                routes: {
                  'sfc': '/sfc',
                  'sfc_line': '/sfc/line',
                  'sfc_combine': '/sfc/combine',
                  'sfc_scroll': '/sfc/scroll',
                  'sfc_sleep': '/sfc/sleep',
                },
                context: context,
              ),
              _buildChartCategory(
                title: 'graphic',
                routes: {
                  'graphic': '/graphic',
                  'graphic_line': '/graphic/line',
                  'graphic_combine': '/graphic/combine',
                  'graphic_scroll': '/graphic/scroll',
                  'graphic_sleep': '/graphic/sleep',
                },
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChartCategory({
    required String title,
    required Map<String, String> routes,
    required BuildContext context,
  }) {
    return ExpansionTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      children:
          routes.entries.map((entry) {
            return ListTile(
              title: Text(entry.key),
              onTap: () => context.push(entry.value, extra: entry.key),
            );
          }).toList(),
    );
  }
}
