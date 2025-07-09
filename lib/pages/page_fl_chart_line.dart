import 'package:flutter/material.dart';
import 'package:flutter_sample_widget/charts/fl_chart_line.dart';

class PageFlLine extends StatelessWidget {
  final String title;

  const PageFlLine({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: const Text('Figmaの折れ線グラフ')),
            Center(
              child: Image.asset(
                'assets/line_graph.png',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Center(child: const Text('再現した折れ線グラフ')),
            SizedBox(height: 200, child: LineChartFL()),
          ],
        ),
      ),
    );
  }
}
