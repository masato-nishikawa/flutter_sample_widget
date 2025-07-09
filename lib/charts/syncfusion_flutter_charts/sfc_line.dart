import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../models/chart_model.dart';
import '../../mock/chart_mock_data.dart';
import 'package:intl/intl.dart';

class LineChartSFC extends StatelessWidget {
  const LineChartSFC({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      backgroundColor: Colors.lightBlue[50],
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        majorTickLines: const MajorTickLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        numberFormat: NumberFormat('#,###'),
        opposedPosition: true,
        minimum: 0,
        maximum: 10000,
        interval: 2500,
        axisLine: const AxisLine(width: 0), // 軸線を消す
        majorTickLines: const MajorTickLines(size: 0), // 目盛線を消す
        majorGridLines: const MajorGridLines(
          width: 1,
          dashArray: [4, 4], // 点線にする（オプション）
          color: Colors.grey,
        ),
      ),
      legend: Legend(isVisible: false),
      series: <CartesianSeries>[
        LineSeries<ChartDate, String>(
          name: '歩数',
          dataSource: mockWalkWeeklyData,
          xValueMapper: (data, _) => data.date,
          yValueMapper: (data, _) => data.value,
          color: Colors.cyan,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      ],
    );
  }
}
