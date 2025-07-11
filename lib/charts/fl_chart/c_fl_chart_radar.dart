import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_widget/mocks/chart_mock.dart';
import 'package:flutter_sample_widget/theme/app_colors.dart';
import 'package:flutter_sample_widget/utils/color_extention.dart';

class RadarChartFL extends StatelessWidget {
  const RadarChartFL({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: RadarChart(
            RadarChartData(
              dataSets: [
                RadarDataSet(
                  dataEntries:
                      mockRadarData
                          .map((e) => RadarEntry(value: e.value))
                          .toList(),
                  fillColor: appColorMap['Mirallel Sky Blue']
                      ?.toColor()
                      .withAlpha((0.3 * 255).toInt()),
                  borderColor: Colors.blue,
                  entryRadius: 0,
                  borderWidth: 0,
                ),
              ],
              radarShape: RadarShape.polygon,
              titlePositionPercentageOffset: 0.4,
              titleTextStyle: TextStyle(fontSize: 12),
              getTitle: (index, _) {
                final rawTitle = mockRadarData[index].date;
                final modifiedTitle = rawTitle.replaceAll('　', '\n');
                final addRatingTitle =
                    '$modifiedTitle\n${ratings[mockRadarData[index].value.toInt() - 1]}';
                return RadarChartTitle(text: addRatingTitle, angle: 0);
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
        ),
      ],
    );
  }
}

class StackRadarChartFL extends StatelessWidget {
  const StackRadarChartFL({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: RadarChart(
            RadarChartData(
              dataSets: [
                RadarDataSet(
                  dataEntries:
                      mockRadarData
                          .map((e) => RadarEntry(value: e.value))
                          .toList(),
                  fillColor: appColorMap['Mirallel Sky Blue']
                      ?.toColor()
                      .withAlpha((0.3 * 255).toInt()),
                  borderColor: Colors.blue,
                  entryRadius: 0,
                  borderWidth: 0,
                ),
              ],
              radarShape: RadarShape.polygon,
              titlePositionPercentageOffset: 0.7,
              titleTextStyle: TextStyle(fontSize: 12),
              getTitle: (index, _) {
                final rawTitle = mockRadarData[index].date;
                final modifiedTitle = rawTitle.replaceAll('　', '\n');
                // final addRatingTitle =
                //     '$modifiedTitle\n${ratings[mockRadarData[index].value.toInt() - 1]}';
                return RadarChartTitle(text: modifiedTitle, angle: 0);
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
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: RadarChart(
            RadarChartData(
              dataSets: [
                RadarDataSet(
                  dataEntries:
                      mockRadarData
                          .map((e) => RadarEntry(value: e.value))
                          .toList(),
                  fillColor: appColorMap['Mirallel Sky Blue']
                      ?.toColor()
                      .withAlpha((0.3 * 255).toInt()),
                  borderColor: Colors.blue,
                  entryRadius: 0,
                  borderWidth: 0,
                ),
              ],
              radarShape: RadarShape.polygon,
              titlePositionPercentageOffset: 0.2,
              titleTextStyle: TextStyle(fontSize: 24),
              getTitle: (index, _) {
                final rawTitle = mockRadarData[index].date;
                // 全角スペースの数をカウント
                final spaceCount = '　'.allMatches(rawTitle).length + 1;
                // 改行文字をスペース数分だけ生成
                final modifiedTitle = List.filled(spaceCount, '\n').join();
                final rawTitle2 =
                    '$modifiedTitle${ratings[mockRadarData[index].value.toInt() - 1]}';
                return RadarChartTitle(text: rawTitle2, angle: 0);
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
        ),
      ],
    );
  }
}
