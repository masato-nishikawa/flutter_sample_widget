import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import '../mock/chart_mock_data.dart';

import 'package:intl/intl.dart';

final commaFormat = NumberFormat("#,###");

class CombineChartGraphic extends StatelessWidget {
  const CombineChartGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    // データを統合してグラフ用に変換

    return Column(
      children: [
        // 軸タイトル
        Container(
          color: Colors.lightBlue[50],
          child: AspectRatio(
            aspectRatio: 2.0,
            child: Chart(
              // グラフ全体の余白を調整（左、上、右、下）
              padding: (_) => const EdgeInsets.fromLTRB(40, 5, 40, 25),
              data: combinedWeeklyData,
              variables: {
                'date': Variable(accessor: (Map map) => map['date'] as String),
                'weight': Variable(
                  accessor: (Map map) => (map['weight'] as num?) ?? 0,
                  scale: LinearScale(min: 0, max: 100),
                ),
                'fat': Variable(
                  accessor: (Map map) => (map['fat'] as num?) ?? 0,
                  scale: LinearScale(min: 0, max: 25),
                ),
              },
              marks: [
                // 体重の棒グラフ（nullでない場合のみ表示）
                IntervalMark(
                  position: Varset('date') * Varset('weight'),
                  color: ColorEncode(
                    value: Colors.cyan,
                    updaters: {
                      'tap': {true: (_) => Colors.cyan},
                    },
                  ),
                  size: SizeEncode(value: 20),
                ),
                LineMark(
                  position: Varset('date') * Varset('fat'),
                  color: ColorEncode(value: Colors.lightBlue),
                ),
                // 色違いのドットを打ちことで再現
                PointMark(
                  position: Varset('date') * Varset('fat'),
                  shape: ShapeEncode(value: CircleShape()),
                  color: ColorEncode(value: Colors.blue),
                  size: SizeEncode(value: 10),
                ),
                PointMark(
                  position: Varset('date') * Varset('fat'),
                  shape: ShapeEncode(value: CircleShape()),
                  color: ColorEncode(value: Colors.white),
                  size: SizeEncode(value: 6),
                ),
              ],
              axes: [
                // x軸の調整
                Defaults.horizontalAxis
                  ..line = PaintStyle(strokeColor: Colors.grey, strokeWidth: 1),
                // Y軸の調整
                AxisGuide(
                  variable: 'weight',
                  dim: Dim.y,
                  grid: PaintStyle(
                    strokeColor: Colors.grey,
                    strokeWidth: 1,
                    dash: [4, 2],
                  ),
                  labelMapper: (text, index, total) {
                    final numVal = double.tryParse(text ?? '');
                    final labelText =
                        (numVal == null)
                            ? ''
                            : '${commaFormat.format(numVal)} kg';
                    return LabelStyle(
                      span:
                          (_) => TextSpan(
                            text: labelText,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                      offset: const Offset(-5, 0),
                    );
                  },
                ),
                AxisGuide(
                  variable: 'fat',
                  position: 1.1,
                  dim: Dim.y,
                  // grid: PaintStyle(
                  //   strokeColor: Colors.grey,
                  //   strokeWidth: 1,
                  //   dash: [4, 2],
                  // ),
                  labelMapper: (text, index, total) {
                    final numVal = double.tryParse(text ?? '');
                    final labelText =
                        (numVal == null)
                            ? ''
                            : '${commaFormat.format(numVal)} %';
                    return LabelStyle(
                      span:
                          (_) => TextSpan(
                            text: labelText,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                      offset: const Offset(5, 0),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
