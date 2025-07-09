import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../models/chart_model.dart';
import '../../mock/chart_mock_data.dart';
import 'package:intl/intl.dart';

class ScrollLineChartSFC extends StatelessWidget {
  const ScrollLineChartSFC({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      backgroundColor: Colors.lightBlue[50],
      primaryXAxis: CategoryAxis(
        axisLabelFormatter: (AxisLabelRenderDetails args) {
          try {
            final parsed = DateFormat('yyyy-MM-dd').parse(args.text);
            final formatted = DateFormat('MM/dd').format(parsed);
            return ChartAxisLabel(formatted, null);
          } catch (e) {
            return ChartAxisLabel(args.text, null);
          }
        },
        majorGridLines: const MajorGridLines(width: 0),
        majorTickLines: const MajorTickLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        numberFormat: NumberFormat('#,###'),
        opposedPosition: true,
        minimum: 0,
        maximum: 10000,
        interval: 2500,
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        majorGridLines: const MajorGridLines(
          width: 1,
          dashArray: [4, 4],
          color: Colors.grey,
        ),
      ),
      legend: Legend(isVisible: false),
      series: <CartesianSeries>[
        LineSeries<ChartDate, String>(
          name: '歩数',
          dataSource: mockWalkMonthlyData,
          xValueMapper: (data, _) => data.date,
          yValueMapper: (data, _) => data.value,
          color: Colors.cyan,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      ],
    );
  }
}
