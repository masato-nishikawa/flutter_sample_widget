import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_widget/mocks/chart_mock.dart';
import 'package:flutter_sample_widget/theme/app_colors.dart';
import 'package:flutter_sample_widget/utils/color_extention.dart';

Color _getColorForRating(String rating) {
  final hex = ratingColorMap[rating];
  return hex != null ? hex.toColor() : Colors.black;
}

class RadarChartFL extends StatelessWidget {
  const RadarChartFL({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 56, 16, 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFB3E5FC), Colors.white],
          stops: [0.0, 0.3],
        ),
      ),
      child: RadarChart(
        RadarChartData(
          dataSets: [
            RadarDataSet(
              dataEntries:
                  mockRadarData.map((e) => RadarEntry(value: e.value)).toList(),
              fillColor: appColorMap['Mirallel Sky Blue']?.toColor().withAlpha(
                (0.3 * 255).toInt(),
              ),
              borderColor: Colors.blue,
              entryRadius: 0,
              borderWidth: 0,
            ),
          ],
          radarShape: RadarShape.polygon,
          titlePositionPercentageOffset: 0.2,
          titleTextStyle: TextStyle(fontSize: 12),
          getTitle: (index, _) {
            final rawTitle = mockRadarData[index].date;
            final modifiedTitle = rawTitle.replaceAll('　', '\n');
            final rating = ratings[mockRadarData[index].value.toInt() - 1];

            return RadarChartTitle(
              text: modifiedTitle, // 上段の項目名（通常の黒）
              children: [
                TextSpan(
                  text: '\n$rating',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: _getColorForRating(rating),
                  ),
                ),
              ],
            );
          },
          tickCount: 5,
          ticksTextStyle: const TextStyle(
            color: Colors.transparent,
            fontSize: 0,
          ),
          tickBorderData: BorderSide(color: Colors.grey.shade300),
          gridBorderData: BorderSide(color: Colors.grey.shade400),
          radarBorderData: BorderSide(color: Colors.grey.shade600),
        ),
      ),
    );
  }
}
