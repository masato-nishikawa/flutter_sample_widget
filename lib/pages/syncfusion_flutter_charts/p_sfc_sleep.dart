import 'package:flutter/material.dart';
import '../../charts/syncfusion_flutter_charts/c_sfc_sleep.dart';

class PageSfcSleep extends StatelessWidget {
  final String title;

  const PageSfcSleep({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: const Text('睡眠グラフ')),
            SizedBox(height: 500, child: SleepChartSFC()),
          ],
        ),
      ),
    );
  }
}
