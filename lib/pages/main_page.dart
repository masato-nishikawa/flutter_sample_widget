import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('メインページ')),
      body: Center(
        child: SingleChildScrollView(
          // 長くなる場合に備えて追加
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ---------------- fl_chart ----------------
              const Text(
                'fl_chart',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () => context.push('/fl_chart', extra: 'fl_chart'),
                child: const Text('fl_chart'),
              ),
              ElevatedButton(
                onPressed:
                    () =>
                        context.push('/fl_chart/line', extra: 'fl_chart_line'),
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
              ElevatedButton(
                onPressed:
                    () => context.push(
                      '/fl_chart/scroll',
                      extra: 'fl_chart_scroll',
                    ),
                child: const Text('fl_chart_scroll'),
              ),
              const SizedBox(height: 24),

              // ---------------- syncfusion_flutter_charts ----------------
              const Text(
                'syncfusion_flutter_charts',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () => context.push('/sfc', extra: 'sfc'),
                child: const Text('sfc'),
              ),
              ElevatedButton(
                onPressed: () => context.push('/sfc/line', extra: 'sfc_line'),
                child: const Text('sfc_line'),
              ),
              ElevatedButton(
                onPressed:
                    () => context.push('/sfc/combine', extra: 'sfc_combine'),
                child: const Text('sfc_combine'),
              ),
              ElevatedButton(
                onPressed:
                    () => context.push('/sfc/scroll', extra: 'sfc_scroll'),
                child: const Text('sfc_scroll'),
              ),

              const SizedBox(height: 24),

              // ---------------- graphic ----------------
              const Text(
                'graphic',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () => context.push('/graphic', extra: 'graphic'),
                child: const Text('graphic'),
              ),
              ElevatedButton(
                onPressed:
                    () => context.push('/graphic/line', extra: 'graphic_line'),
                child: const Text('graphic_line'),
              ),
              ElevatedButton(
                onPressed:
                    () => context.push(
                      '/graphic/combine',
                      extra: 'graphic_combine',
                    ),
                child: const Text('graphic_combine'),
              ),
              ElevatedButton(
                onPressed:
                    () => context.push(
                      '/graphic/scroll',
                      extra: 'graphic_scroll',
                    ),
                child: const Text('graphic_scroll'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
