import 'package:flutter/material.dart';
import 'package:flutter_sample_widget/charts/graphic/c_graphic_radar.dart';

class PageGraphicRadar extends StatelessWidget {
  final String title;

  const PageGraphicRadar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: const Text('Figmaのレーダーチャート')),
            const SizedBox(height: 4),
            Center(
              child: Image.asset(
                'assets/radar_chart.png',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 32),
            Center(child: const Text('レーダーチャート')),
            const SizedBox(height: 4),
            const Expanded(child: RadarChartGraphic()),
          ],
        ),
      ),
    );
  }
}
