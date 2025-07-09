import 'package:flutter/material.dart';
import '../../charts/syncfusion_flutter_charts/c_sfc_scroll.dart';

class PageSfcScroll extends StatelessWidget {
  final String title;

  const PageSfcScroll({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('スクロール折れ線グラフ'),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 1000,
                    child: const ScrollLineChartSFC(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
