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
    // 全データを取得
    final allData = convertToSleepSegments(mockSleepWeeklyData);

    // 日付のリストを作成（順序を保証）
    final allDates = allData.map((e) => e.date).toSet().toList();

    // 各日付に対してデータが存在することを保証
    List<SleepSegment> getSegmentDataForDates(double from, double to) {
      final filteredData =
          allData.where((s) => s.start >= from && s.end <= to).toList();

      // 各日付に対してデータを作成（存在しない場合は空のセグメント）
      return allDates.map((date) {
        final existingData = filteredData.where((s) => s.date == date).toList();
        if (existingData.isEmpty) {
          // データが存在しない場合は、非表示のセグメントを作成
          return SleepSegment(date: date, start: from, end: from);
        }
        return existingData.first;
      }).toList();
    }

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
                  dataSource: getSegmentDataForDates(19, 24),
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
                  dataSource: getSegmentDataForDates(0, 15),
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
