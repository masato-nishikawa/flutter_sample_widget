import 'package:flutter/material.dart';
import '../../charts/syncfusion_flutter_charts/c_sfc_combine.dart';

class PageSfcCombine extends StatelessWidget {
  final String title;

  const PageSfcCombine({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: const Text('Figmaの複合グラフ')),
            Center(
              child: Image.asset(
                'assets/combine_graph.png',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Center(child: const Text('再現した複合グラフ')),
            SizedBox(height: 200, child: CombineChartSFC()),
          ],
        ),
      ),
    );
  }
}
