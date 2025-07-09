import 'package:flutter/material.dart';
import 'package:flutter_sample_widget/charts/graphic/c_graphic.dart';

class PageGraphic extends StatelessWidget {
  final String title;

  const PageGraphic({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Expanded(child: FatChartGraphic()),
            const Expanded(child: WeightChartGraphic()),
            const Expanded(child: WeightFatChartGraphic()),
          ],
        ),
      ),
    );
  }
}
