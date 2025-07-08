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
              onPressed: () => context.push('/a', extra: 'fl_chart'),
              child: const Text('fl_chart'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed:
                  () =>
                      context.push('/sfc', extra: 'syncfusion_flutter_charts'),
              child: const Text('syncfusion_flutter_charts'),
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
