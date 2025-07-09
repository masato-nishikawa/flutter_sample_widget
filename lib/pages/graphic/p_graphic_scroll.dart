import 'package:flutter/material.dart';
import '../../charts/graphic/c_graphic_scroll.dart';

class PageGraphicLineScroll extends StatelessWidget {
  final String title;

  const PageGraphicLineScroll({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: const Text('スクロールの折れ線グラフ')),
            const Expanded(child: ScrollLineChartGraphic()),
          ],
        ),
      ),
    );
  }
}
