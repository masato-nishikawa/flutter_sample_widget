import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_widget/mocks/chart_mock.dart';
import 'package:intl/intl.dart';

final numberFormatter = NumberFormat('#,###');

class LineChartCombineFL extends StatelessWidget {
  const LineChartCombineFL({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 棒グラフとの余白合わせ
      padding: const EdgeInsets.only(left: 77),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(mockFatWeeklyData.length, (index) {
                return FlSpot(index.toDouble(), mockFatWeeklyData[index].value);
              }),
              isCurved: false,
              color: Colors.blue,
              barWidth: 2,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 3,
                    color: Colors.white,
                    strokeWidth: 2,
                    strokeColor: Colors.blue,
                  );
                },
              ),
            ),
          ],
          minY: 0,
          maxY: 25,
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false, reservedSize: 0),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                // 棒グラフとの余白合わせ
                reservedSize: 77,
                interval: 6.25,
                getTitlesWidget: (value, _) {
                  return Text(
                    '${numberFormatter.format(value)}%',
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                    textAlign: TextAlign.right,
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, _) {
                  const labels = ['日', '月', '火', '水', '木', '金', '土'];
                  if (value.toInt() >= 0 && value.toInt() < labels.length) {
                    return Text(
                      labels[value.toInt()],
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false, // 縦線は非表示
            drawHorizontalLine: true, // 横線は表示
            horizontalInterval: 2500, // 横線の間隔
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey,
                strokeWidth: 1,
                dashArray: [5, 5], // 点線スタイル
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
        ),
      ),
    );
  }
}

class BarChartCombineFL extends StatelessWidget {
  const BarChartCombineFL({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 折れ線グラフとの余白合わせ
      padding: const EdgeInsets.only(right: 48),
      child: BarChart(
        BarChartData(
          barGroups: List.generate(mockWeightWeeklyData.length, (index) {
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: mockWeightWeeklyData[index].value,
                  color: Colors.cyan,
                  width: 15,
                  borderRadius: BorderRadius.zero,
                ),
              ],
            );
          }),
          minY: 0,
          maxY: 100,
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                // 折れ線グラフとの余白合わせ
                reservedSize: 48,
                interval: 25,
                getTitlesWidget: (value, _) {
                  return Text(
                    '${numberFormatter.format(value)}kg',
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                    textAlign: TextAlign.right,
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _) {
                  const labels = ['日', '月', '火', '水', '木', '金', '土'];
                  if (value.toInt() >= 0 && value.toInt() < labels.length) {
                    return Text(
                      labels[value.toInt()],
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false, // 縦線は非表示
            drawHorizontalLine: true, // 横線は表示
            horizontalInterval: 25, // 横線の間隔
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey,
                strokeWidth: 1,
                dashArray: [5, 5], // 点線スタイル
              );
            },
          ),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }
}
