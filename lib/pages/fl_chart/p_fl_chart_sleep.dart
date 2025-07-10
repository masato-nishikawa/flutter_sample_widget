import 'package:flutter/material.dart';
import 'package:flutter_sample_widget/charts/fl_chart/c_fl_chart_sleep.dart';

class PageFlSleep extends StatelessWidget {
  final String title;

  const PageFlSleep({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: const Text('19-24, 0-15の睡眠グラフ')),
            const Expanded(child: SleepBarChartFL()),
          ],
        ),
      ),
    );
  }
}
