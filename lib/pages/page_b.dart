import 'package:flutter/material.dart';
import '../charts/syncfusion_flutter_charts.dart'; 

class PageB extends StatelessWidget {
  final String title;

  const PageB({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Expanded( 
              child: WeightFatChart(),
            ),
            const Expanded( 
              child: WeightChart(),
            ),
            const Expanded( 
              child: FatChart(),
            ),
          ],
        ),
      ),
    );
  }
}