import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
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

class SleepBarChartFL extends StatelessWidget {
  const SleepBarChartFL({super.key});

  @override
  Widget build(BuildContext context) {
    final sleepData = convertToSleepSegments(mockSleepWeeklyData);

    final List<String> weekdays = ['日', '月', '火', '水', '木', '金', '土'];

    // 夜のセグメント（19-24時）
    final upperGroups = List.generate(weekdays.length, (i) {
      final segments =
          sleepData
              .where(
                (s) => s.date == weekdays[i] && s.start >= 19 && s.end <= 24,
              )
              .map(
                (s) => BarChartRodStackItem(
                  // 19,
                  // 23,
                  43 - s.end,
                  43 - s.start,
                  Colors.blue,
                ),
              )
              .toList();

      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            fromY: 19,
            toY: 24,
            rodStackItems: segments,
            width: 18,
            borderRadius: BorderRadius.circular(2),
            color: Colors.transparent,
          ),
        ],
      );
    });

    // 朝のセグメント（0-15時）
    final lowerGroups = List.generate(weekdays.length, (i) {
      final segments =
          sleepData
              .where(
                (s) => s.date == weekdays[i] && s.start >= 0 && s.end <= 15,
              )
              .map(
                (s) => BarChartRodStackItem(
                  15 - s.end, // ←反転
                  15 - s.start,
                  Colors.blue,
                ),
              )
              .toList();

      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            fromY: 0,
            toY: 15,
            rodStackItems: segments,
            width: 18,
            borderRadius: BorderRadius.circular(2),
            color: Colors.transparent,
          ),
        ],
      );
    });

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 8),

          // 上段チャート（19-24時）
          SizedBox(
            height: 100,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                barGroups: upperGroups,
                minY: 19,
                maxY: 24,
                gridData: FlGridData(show: true),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 3,
                      reservedSize: 28,
                      getTitlesWidget: (value, _) {
                        final inverted = (19 + 24) - value;
                        if (value == 19) return const SizedBox.shrink();
                        return Text(inverted.toInt().toString());
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
              ),
            ),
          ),

          // 下段チャート（0-15時）※ラベルを反転
          SizedBox(
            height: 300,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                barGroups: lowerGroups,
                minY: 0,
                maxY: 15,
                gridData: FlGridData(show: true),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 3,
                      reservedSize: 28,
                      getTitlesWidget: (value, _) {
                        return Text((15 - value).toInt().toString());
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, _) {
                        if (value >= 0 && value < weekdays.length) {
                          return Text(weekdays[value.toInt()]);
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
