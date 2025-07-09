import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('メインページ')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.push('/fl_chart', extra: 'fl_chart'),
              child: const Text('fl_chart'),
            ),
            ElevatedButton(
              onPressed:
                  () => context.push('/fl_chart/line', extra: 'fl_chart_line'),
              child: const Text('fl_chart_line'),
            ),
            ElevatedButton(
              onPressed:
                  () => context.push(
                    '/fl_chart/combine',
                    extra: 'fl_chart_combine',
                  ),
              child: const Text('fl_chart_combine'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed:
                  () =>
                      context.push('/sfc', extra: 'syncfusion_flutter_charts'),
              child: const Text('syncfusion_flutter_charts'),
            ),
            ElevatedButton(
              onPressed:
                  () => context.push(
                    '/sfc/line',
                    extra: 'syncfusion_flutter_charts_line',
                  ),
              child: const Text('syncfusion_flutter_charts_line'),
            ),
            ElevatedButton(
              onPressed:
                  () => context.push(
                    '/sfc/combine',
                    extra: 'syncfusion_flutter_charts_combine',
                  ),
              child: const Text('syncfusion_flutter_charts_combine'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.push('/graphic', extra: 'graphic'),
              child: const Text('graphic'),
            ),
            ElevatedButton(
              onPressed:
                  () => context.push('/graphic/line', extra: 'graphic_Line'),
              child: const Text('graphic_Line'),
            ),
            ElevatedButton(
              onPressed:
                  () => context.push(
                    '/graphic/combine',
                    extra: 'graphic_Combine',
                  ),
              child: const Text('graphic_Combine'),
            ),
          ],
        ),
      ),
    );
  }
}
