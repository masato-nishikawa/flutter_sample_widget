import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sample_widget/theme/app_colors.dart';
import 'package:flutter_sample_widget/utils/color_extention.dart';
// import 'package:flutter_sample_widget/theme/app_colors.dart';
// import 'package:flutter_sample_widget/utils/color_extention.dart';
import 'package:graphic/graphic.dart';
// import 'package:flutter_sample_widget/mocks/chart_mock.dart';

const radarRaw = [
  {'type': 'data', 'label': '体組成・血圧', 'value': 5},
  {'type': 'data', 'label': '初診　スクリーニング', 'value': 4},
  {'type': 'data', 'label': '日常生活', 'value': 3},
  {'type': 'data', 'label': '食生活', 'value': 2},
  {'type': 'data', 'label': '自覚症状', 'value': 1},
  {'type': 'data', 'label': '体組成・血圧', 'value': 5},

  {'type': '1', 'label': '体組成・血圧', 'value': 1},
  {'type': '1', 'label': '初診　スクリーニング', 'value': 1},
  {'type': '1', 'label': '日常生活', 'value': 1},
  {'type': '1', 'label': '食生活', 'value': 1},
  {'type': '1', 'label': '自覚症状', 'value': 1},
  {'type': '1', 'label': '体組成・血圧', 'value': 1},

  {'type': '2', 'label': '体組成・血圧', 'value': 2},
  {'type': '2', 'label': '初診　スクリーニング', 'value': 2},
  {'type': '2', 'label': '日常生活', 'value': 2},
  {'type': '2', 'label': '食生活', 'value': 2},
  {'type': '2', 'label': '自覚症状', 'value': 2},
  {'type': '2', 'label': '体組成・血圧', 'value': 2},

  {'type': '3', 'label': '体組成・血圧', 'value': 3},
  {'type': '3', 'label': '初診　スクリーニング', 'value': 3},
  {'type': '3', 'label': '日常生活', 'value': 3},
  {'type': '3', 'label': '食生活', 'value': 3},
  {'type': '3', 'label': '自覚症状', 'value': 3},
  {'type': '3', 'label': '体組成・血圧', 'value': 3},

  {'type': '4', 'label': '体組成・血圧', 'value': 4},
  {'type': '4', 'label': '初診　スクリーニング', 'value': 4},
  {'type': '4', 'label': '日常生活', 'value': 4},
  {'type': '4', 'label': '食生活', 'value': 4},
  {'type': '4', 'label': '自覚症状', 'value': 4},
  {'type': '4', 'label': '体組成・血圧', 'value': 4},

  {'type': '5', 'label': '体組成・血圧', 'value': 5},
  {'type': '5', 'label': '初診　スクリーニング', 'value': 5},
  {'type': '5', 'label': '日常生活', 'value': 5},
  {'type': '5', 'label': '食生活', 'value': 5},
  {'type': '5', 'label': '自覚症状', 'value': 5},
  {'type': '5', 'label': '体組成・血圧', 'value': 5},
];

const ratings = ['A', 'B', 'C', 'D', 'E'];

Color _getColorForRating(String rating) {
  final hex = ratingColorMap[rating];
  return hex != null ? hex.toColor() : Colors.black;
}

class RadarChartGraphic extends StatelessWidget {
  const RadarChartGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFB3E5FC), Colors.white],
          stops: [0.0, 0.3],
        ),
      ),
      child: Stack(
        children: [
          // 表示するデータの部分
          Chart(
            data: radarRaw.where((e) => e['type'] == 'data').toList(),
            variables: {
              'label': Variable(
                accessor: (Map map) {
                  final rawLabel = map['label'].toString().replaceAll(
                    '　',
                    '\n',
                  );
                  final type = map['type'];
                  String? rating;
                  if (type == 'data') {
                    final value = map['value'] as int;
                    rating = ratings[5 - value];
                  }
                  return rating != null ? '$rawLabel\n$rating' : rawLabel;
                },
              ),
              'type': Variable(accessor: (Map map) => map['type'] as String),
              'value': Variable(accessor: (Map map) => map['value'] as num),
            },
            marks: [
              LineMark(
                position: Varset('label') * Varset('value') / Varset('type'),
                color: ColorEncode(
                  variable: 'type',
                  values: [
                    Colors.blue.withAlpha(76),
                    ...List.filled(5, Colors.grey.withAlpha(76)),
                  ],
                ),
                shape: ShapeEncode(value: BasicLineShape(loop: true)),
              ),
              AreaMark(
                position: Varset('label') * Varset('value') / Varset('type'),
                color: ColorEncode(
                  variable: 'type',
                  values: [
                    Colors.blue.withAlpha(76),
                    ...List.filled(5, Colors.transparent),
                  ],
                ),
                shape: ShapeEncode(value: BasicAreaShape()),
              ),
            ],
            // 極座標系において5角形を定義する
            coord: PolarCoord(
              startAngle: -pi / 2 - pi / 5,
              endAngle: 3 * pi / 2 - pi / 5,
              endRadius: 0.75,
            ),
            axes: [
              Defaults.circularAxis
                ..line = null
                ..label = LabelStyle(
                  textAlign: TextAlign.center,
                  span: (text) {
                    final lines = text.split('\n');
                    if (lines.length >= 3) {
                      // 改行が2回以上（＝3行以上）のときの処理
                      return TextSpan(
                        children: [
                          TextSpan(
                            text: '${lines[0]}\n${lines[1]}\n',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: lines[2],
                            style: TextStyle(
                              color: _getColorForRating(lines[2]),
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                        ],
                      );
                    } else if (lines.length == 2) {
                      // 2行（評価付き）
                      return TextSpan(
                        children: [
                          TextSpan(
                            text: '${lines[0]}\n',
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: lines[1],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _getColorForRating(lines[1]),
                              fontSize: 28,
                            ),
                          ),
                        ],
                      );
                    } else {
                      // 1行（評価なし）
                      return TextSpan(
                        text: text,
                        style: const TextStyle(color: Colors.black),
                      );
                    }
                  },
                ),
              Defaults.radialAxis
                ..line = null
                ..grid = null
                ..label = null,
            ],
          ),
          // レーダーグラフの部分を表示
          Chart(
            data: radarRaw.where((e) => e['type'] != 'data').toList(),
            variables: {
              'label': Variable(accessor: (Map map) => map['label'] as String),
              'type': Variable(accessor: (Map map) => map['type'] as String),
              'value': Variable(accessor: (Map map) => map['value'] as num),
            },
            marks: [
              LineMark(
                position: Varset('label') * Varset('value') / Varset('type'),
                color: ColorEncode(
                  variable: 'type',
                  values: [...List.filled(6, Colors.grey.withAlpha(76))],
                ),
                shape: ShapeEncode(value: BasicLineShape(loop: true)),
              ),
              AreaMark(
                position: Varset('label') * Varset('value') / Varset('type'),
                color: ColorEncode(
                  variable: 'type',
                  values: [...List.filled(6, Colors.transparent)],
                ),
                shape: ShapeEncode(value: BasicAreaShape()),
              ),
            ],
            // 極座標系において5角形を定義する
            coord: PolarCoord(
              startAngle: -pi / 2 - pi / 5,
              endAngle: 3 * pi / 2 - pi / 5,
              endRadius: 0.75,
            ),
            axes: [
              Defaults.circularAxis
                ..line = null
                ..grid = null
                ..label = null,
              Defaults.radialAxis
                ..line = null
                ..grid = null
                ..label = null,
            ],
          ),
        ],
      ),
    );
  }
}
