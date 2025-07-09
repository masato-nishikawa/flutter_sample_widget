import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../mock/chart_mock_data.dart';
import 'package:intl/intl.dart';

final numberFormatter = NumberFormat('#,###');

class ScrollLineChartFL extends StatelessWidget {
  const ScrollLineChartFL({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[50],
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(mockWalkMonthlyData.length, (index) {
                return FlSpot(
                  index.toDouble(),
                  mockWalkMonthlyData[index].value,
                );
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
          maxY: 10000,
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 48,
                interval: 2500,
                getTitlesWidget: (value, _) {
                  return Transform.translate(
                    offset: const Offset(0, 4), // y軸方向に4px下に移動
                    child: Text(
                      numberFormatter.format(value),
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                      textAlign: TextAlign.right,
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, _) {
                  if (value.toInt() >= 0 &&
                      value.toInt() < mockWalkMonthlyData.length) {
                    final dateStr = mockWalkMonthlyData[value.toInt()].date;
                    final date = DateTime.tryParse(dateStr);
                    final label =
                        (date != null) ? DateFormat('M/d').format(date) : '';
                    return Text(
                      label,
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
