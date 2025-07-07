import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeightFatChartFL extends StatelessWidget {
  const WeightFatChartFL({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            /// 🔷 背景に体重の棒グラフ
            BarChart(
              BarChartData(
                barGroups: [
                  BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 65, color: Colors.cyan)]),
                  BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 70, color: Colors.cyan)]),
                  BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 75, color: Colors.cyan)]),
                  BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 72, color: Colors.cyan)]),
                ],
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, _) => Text('$value kg', style: const TextStyle(fontSize: 10)),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, _) {
                        const labels = ['01/01', '04/01', '07/01', '10/01'];
                        if (value.toInt() < labels.length) {
                          return Text(labels[value.toInt()], style: const TextStyle(fontSize: 10));
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
              ),
            ),

           /// 🔵 前面に体脂肪率の折れ線グラフ
            LineChart(
              LineChartData(
                minX: -1,
                maxX: 2,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 25.0),
                      FlSpot(0.6, 24.5),
                      FlSpot(1.225, 23.2),
                      FlSpot(1.85, 22.8),
                    ],
                    isCurved: false,
                    color: Colors.red,
                    barWidth: 2,
                    dotData: FlDotData(show: true),
                  ),
                ],
                minY: 20,
                maxY: 30,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                    getTitlesWidget: (value, _) => Text('$value %', style: const TextStyle(fontSize: 10)),
                    ),
                  ),
                ),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeightChartFL extends StatelessWidget {
  const WeightChartFL({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BarChart(
          BarChartData(
            barGroups: [
              BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 65, color: Colors.cyan)]),
              BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 70, color: Colors.cyan)]),
              BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 75, color: Colors.cyan)]),
              BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 70, color: Colors.cyan)]),
            ],
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitlesWidget: (value, _) => Text('$value kg', style: const TextStyle(fontSize: 10)),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, _) {
                    const labels = ['01/01', '04/01', '07/01', '10/01'];
                    if (value.toInt() < labels.length) {
                      return Text(labels[value.toInt()], style: const TextStyle(fontSize: 10));
                    }
                    return const Text('');
                  },
                ),
              ),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
          ),
        ),
      ),
    );
  }
}

class FatChartFL extends StatelessWidget {
  const FatChartFL({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 25.0),
                  FlSpot(1, 24.5),
                  FlSpot(2, 23.2),
                  FlSpot(3, 22.8),
                ],
                isCurved: false,
                color: Colors.lightBlue,
                barWidth: 2,
                dotData: FlDotData(show: true),
              ),
            ],
            minY: 20,
            maxY: 30,
            titlesData: FlTitlesData(
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, _) {
                    const labels = ['01/01', '04/01', '07/01', '10/01'];
                    if (value.toInt() < labels.length) {
                      return Text(labels[value.toInt()], style: const TextStyle(fontSize: 10));
                    }
                    return const Text('');
                  },
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                getTitlesWidget: (value, _) => Text('$value %', style: const TextStyle(fontSize: 10)),
                ),
              ),
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
          ),
        ),
      ),
    );
  }
}