import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../models/chart_model.dart';
import 'package:flutter_sample_widget/mocks/chart_mock.dart';
import 'package:intl/intl.dart';

class CombineChartSFC extends StatelessWidget {
  const CombineChartSFC({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      backgroundColor: Colors.lightBlue[50],
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        majorTickLines: const MajorTickLines(width: 0),
        labelStyle: const TextStyle(color: Colors.grey),
      ),
      primaryYAxis: NumericAxis(
        numberFormat: NumberFormat('#,###'),
        minimum: 0,
        maximum: 100,
        interval: 25,
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        majorGridLines: const MajorGridLines(
          width: 1,
          dashArray: [4, 4],
          color: Colors.grey,
        ),
        axisLabelFormatter: (AxisLabelRenderDetails args) {
          final numVal = double.tryParse(args.text) ?? 0;
          return ChartAxisLabel(
            '${numVal.toStringAsFixed(0)} kg',
            const TextStyle(color: Colors.grey),
          );
        },
      ),
      axes: <ChartAxis>[
        NumericAxis(
          name: 'fatAxis',
          numberFormat: NumberFormat('#,###'),
          opposedPosition: true,
          minimum: 0,
          maximum: 25,
          interval: 6.25,
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0),
          axisLabelFormatter: (AxisLabelRenderDetails args) {
            final numVal = double.tryParse(args.text) ?? 0;
            return ChartAxisLabel(
              '${numVal.toStringAsFixed(0)} %',
              const TextStyle(color: Colors.grey),
            );
          },
        ),
      ],
      legend: Legend(isVisible: false),
      series: <CartesianSeries>[
        ColumnSeries<ChartDate, String>(
          name: '体重',
          dataSource: mockWeightWeeklyData,
          xValueMapper: (data, _) => data.date,
          yValueMapper: (data, _) => data.value,
          color: Colors.cyan,
          width: 0.4,
        ),
        LineSeries<ChartDate, String>(
          name: '体脂肪率',
          dataSource: mockFatWeeklyData,
          xValueMapper: (data, _) => data.date,
          yValueMapper: (data, _) => data.value,
          color: Colors.cyan,
          markerSettings: const MarkerSettings(isVisible: true),
          yAxisName: 'fatAxis',
        ),
      ],
    );
  }
}
