import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/chart_data.dart';
import '../mock/chart_mock_data.dart';
import 'package:intl/intl.dart';

class WeightFatChartSFC extends StatelessWidget {
  const WeightFatChartSFC({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(isVisible: true),
      primaryXAxis: CategoryAxis(
        axisLabelFormatter: (AxisLabelRenderDetails args) {
          try {
            final parsed = DateTime.parse(args.text);
            final formatted = DateFormat('MM/dd').format(parsed);
            return ChartAxisLabel(formatted, null);
          } catch (e) {
            return ChartAxisLabel(args.text, null);
          }
        },
      ),
      primaryYAxis: NumericAxis(title: AxisTitle(text: '体重 (kg)')),
      axes: <ChartAxis>[
        NumericAxis(
          name: 'fatAxis',
          opposedPosition: true,
          title: AxisTitle(text: '体脂肪率 (%)'),
        ),
      ],
      series: <CartesianSeries>[
        ColumnSeries<ChartDate, String>(
          name: '体重',
          dataSource: mockWeightData,
          xValueMapper: (data, _) => data.date,
          yValueMapper: (data, _) => data.value,
          color: Colors.cyan,
        ),
        LineSeries<ChartDate, String>(
          name: '体脂肪',
          dataSource: mockFatData,
          xValueMapper: (data, _) => data.date,
          yValueMapper: (data, _) => data.value,
          yAxisName: 'fatAxis',
          markerSettings: const MarkerSettings(isVisible: true),
          color: Colors.red,
        ),
      ],
    );
  }
}

class WeightChartSFC extends StatelessWidget {
  const WeightChartSFC({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: '体重の推移'),
      primaryXAxis: CategoryAxis(
        axisLabelFormatter: (AxisLabelRenderDetails args) {
          try {
            final parsed = DateTime.parse(args.text);
            final formatted = DateFormat('MM/dd').format(parsed);
            return ChartAxisLabel(formatted, null);
          } catch (e) {
            return ChartAxisLabel(args.text, null); // fallback if parse fails
          }
        },
      ),
      primaryYAxis: NumericAxis(title: AxisTitle(text: '体重 (kg)')),
      legend: Legend(isVisible: false),
      series: <CartesianSeries>[
        ColumnSeries<ChartDate, String>(
          name: '体重',
          dataSource: mockWeightData,
          xValueMapper: (data, _) => data.date,
          yValueMapper: (data, _) => data.value,
          color: Colors.cyan,
        ),
      ],
    );
  }
}

class FatChartSFC extends StatelessWidget {
  const FatChartSFC({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: '体脂肪率の推移'),
      primaryXAxis: CategoryAxis(
        axisLabelFormatter: (AxisLabelRenderDetails args) {
          try {
            final parsed = DateTime.parse(args.text);
            final formatted = DateFormat('MM/dd').format(parsed);
            return ChartAxisLabel(formatted, null);
          } catch (e) {
            return ChartAxisLabel(args.text, null); // fallback if parse fails
          }
        },
      ),
      primaryYAxis: NumericAxis(title: AxisTitle(text: '体脂肪率 (%)')),
      legend: Legend(isVisible: false),
      series: <CartesianSeries>[
        LineSeries<ChartDate, String>(
          name: '体脂肪',
          dataSource: mockFatData,
          xValueMapper: (data, _) => data.date,
          yValueMapper: (data, _) => data.value,
          color: Colors.red,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      ],
    );
  }
}
