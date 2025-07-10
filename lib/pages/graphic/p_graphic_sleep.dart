import 'package:flutter/material.dart';
import '../../charts/graphic/c_graphic_sleep.dart';

class PageGraphicBarSleep extends StatelessWidget {
  final String title;

  const PageGraphicBarSleep({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: const Text('19-24, 0-15の睡眠グラフ')),
            const Expanded(child: SleepBarChartGraphic()),
          ],
        ),
      ),
    );
  }
}
