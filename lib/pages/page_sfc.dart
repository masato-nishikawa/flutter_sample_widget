import 'package:flutter/material.dart';
import '../charts/syncfusion_flutter_charts.dart';

class PageSfc extends StatelessWidget {
  final String title;

  const PageSfc({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Expanded(child: FatChartSFC()),
            const Expanded(child: WeightChartSFC()),
            const Expanded(child: WeightFatChartSFC()),
          ],
        ),
      ),
    );
  }
}
