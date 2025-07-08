import 'package:flutter/material.dart';
import '../charts/graphic_combine.dart';

class PageE extends StatelessWidget {
  final String title;

  const PageE({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [const Expanded(child: CombineChartGraphic())]),
      ),
    );
  }
}
