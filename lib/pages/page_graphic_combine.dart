import 'package:flutter/material.dart';
import '../charts/graphic_combine.dart';

class PageGraphicCombine extends StatelessWidget {
  final String title;

  const PageGraphicCombine({super.key, required this.title});

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
            const Expanded(child: CombineChartGraphic()),
          ],
        ),
      ),
    );
  }
}
