import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_sample_widget/mocks/chart_mock.dart';

class SleepSegment {
  final String date;
  final double start;
  final double end;

  SleepSegment({required this.date, required this.start, required this.end});
}

List<SleepSegment> convertToSleepSegments(List<Map<String, dynamic>> raw) {
  return raw.map((e) {
    return SleepSegment(
      date: e['date'] as String,
      start: (e['start'] as num).toDouble(),
      end: (e['end'] as num).toDouble(),
    );
  }).toList();
}

List<SleepSegment> getSegmentData(double from, double to) {
  return convertToSleepSegments(
    mockSleepWeeklyData,
  ).where((s) => s.start >= from && s.end <= to).toList();
}

class SleepChartSFC extends StatelessWidget {
  const SleepChartSFC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: SfCartesianChart(
              margin: EdgeInsets.zero,
              primaryXAxis: CategoryAxis(
                majorGridLines: const MajorGridLines(width: 0),
                majorTickLines: const MajorTickLines(width: 0),
                isVisible: false,
              ),
              primaryYAxis: NumericAxis(
                minimum: 19,
                maximum: 24,
                interval: 2,
                isInversed: true,
              ),
              series: <CartesianSeries>[
                RangeColumnSeries<SleepSegment, String>(
                  dataSource: convertToSleepSegments(mockSleepWeeklyData),
                  xValueMapper: (s, _) => s.date,
                  lowValueMapper: (s, _) => s.start,
                  highValueMapper: (s, _) => s.end,
                  color: Colors.blue,
                  width: 0.5,
                  spacing: 0.1,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: SfCartesianChart(
              margin: EdgeInsets.zero,
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 15,
                interval: 3,
                isInversed: true,
                labelStyle: TextStyle(fontSize: 13.5),
              ),
              series: <CartesianSeries>[
                RangeColumnSeries<SleepSegment, String>(
                  dataSource: convertToSleepSegments(mockSleepWeeklyData),
                  xValueMapper: (s, _) => s.date,
                  lowValueMapper: (s, _) => s.start,
                  highValueMapper: (s, _) => s.end,
                  color: Colors.blue,
                  width: 0.5,
                  spacing: 0.1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
