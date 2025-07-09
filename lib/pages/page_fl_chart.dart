import 'package:flutter/material.dart';
import 'package:flutter_sample_widget/charts/fl_chart.dart';

class PageFl extends StatelessWidget {
  final String title;

  const PageFl({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Expanded(child: FatChartFL()),
            const Expanded(child: WeightChartFL()),
            const Expanded(child: WeightFatChartFL()),
          ],
        ),
      ),
    );
  }
}
