import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
// import '../models/chart_data.dart';
import '../mock/chart_mock_data.dart';

class WeightFatChartFL extends StatelessWidget {
  const WeightFatChartFL({super.key});
  final String lineColor = 'cyan';

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
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: mockWeightData[0].value,
                        color: Colors.cyan,
                        width: 30,
                        borderRadius: BorderRadius.zero,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        toY: mockWeightData[1].value,
                        color: Colors.cyan,
                        width: 30,
                        borderRadius: BorderRadius.zero,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                        toY: mockWeightData[2].value,
                        color: Colors.cyan,
                        width: 30,
                        borderRadius: BorderRadius.zero,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                        toY: mockWeightData[3].value,
                        color: Colors.cyan,
                        width: 30,
                        borderRadius: BorderRadius.zero,
                      ),
                    ],
                  ),
                ],
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget:
                          (value, _) => Text(
                            '$value kg',
                            style: const TextStyle(fontSize: 10),
                          ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, _) {
                        const labels = ['01/01', '04/01', '07/01', '10/01'];
                        if (value.toInt() < labels.length) {
                          return Text(
                            labels[value.toInt()],
                            style: const TextStyle(fontSize: 10),
                          );
                        }
                        return const Text('');
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
                      FlSpot(-0.1, mockFatData[0].value),
                      FlSpot(0.6, mockFatData[1].value),
                      FlSpot(1.25, mockFatData[2].value),
                      FlSpot(1.9, mockFatData[3].value),
                    ],
                    isCurved: false,
                    color: Colors.red,
                    barWidth: 2,
                    dotData: FlDotData(show: true),
                  ),
                ],
                minY: 22,
                maxY: 25,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget:
                          (value, _) => Padding(
                            padding: const EdgeInsets.only(left: 4), // ← 右にズラす
                            child: Text(
                              '$value %',
                              style: const TextStyle(fontSize: 10),
                            ),
                          ),
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
            barGroups: List.generate(mockWeightData.length, (index) {
              return BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: mockWeightData[index].value,
                    color: Colors.cyan,
                    width: 30,
                    borderRadius: BorderRadius.zero,
                  ),
                ],
              );
            }),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitlesWidget:
                      (value, _) => Text(
                        '$value kg',
                        style: const TextStyle(fontSize: 10),
                      ),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, _) {
                    const labels = ['01/01', '04/01', '07/01', '10/01'];
                    if (value.toInt() < labels.length) {
                      return Text(
                        labels[value.toInt()],
                        style: const TextStyle(fontSize: 10),
                      );
                    }
                    return const Text('');
                  },
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
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
                spots: List.generate(mockFatData.length, (index) {
                  return FlSpot(index.toDouble(), mockFatData[index].value);
                }),
                isCurved: false,
                color: Colors.red,
                barWidth: 2,
                dotData: FlDotData(show: true),
              ),
            ],
            minY: 22,
            maxY: 25,
            titlesData: FlTitlesData(
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, _) {
                    const labels = ['01/01', '04/01', '07/01', '10/01'];
                    if (value.toInt() < labels.length) {
                      return Text(
                        labels[value.toInt()],
                        style: const TextStyle(fontSize: 10),
                      );
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
                  getTitlesWidget:
                      (value, _) => Text(
                        '$value %',
                        style: const TextStyle(fontSize: 10),
                      ),
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
