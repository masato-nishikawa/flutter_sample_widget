import 'package:flutter/material.dart';
import 'package:flutter_sample_widget/fl_sample/sample1 copy.dart';

class PageD extends StatelessWidget {
  final String title;

  const PageD({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
             Expanded(
              child: CompositeChartPage(),
            ),
            // const Expanded(
            //   child: LineChartSample1(),
            // ),
          ],
        ),
      ),
    );
  }
}