import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import '../mock/chart_mock_data.dart';
import 'package:intl/intl.dart';

final NumberFormat commaFormat = NumberFormat('#,###');

class LineChartGraphic extends StatelessWidget {
  const LineChartGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: const Text('Figmaの折れ線グラフ')),
        Center(
          child: Image.asset(
            'assets/line_graph.png',
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Center(child: const Text('再現した折れ線グラフ')),
        Container(
          color: Colors.lightBlue[50],
          child: AspectRatio(
            aspectRatio: 2.0,
            child: Chart(
              // グラフ全体の余白を調整（左、上、右、下）
              padding: (_) => const EdgeInsets.fromLTRB(0, 5, 50, 25),
              data:
                  mockWalkWeeklyData
                      .map((e) => {'date': e.date, 'value': e.value})
                      .toList(),
              variables: {
                'date': Variable(
                  accessor:
                      (map) => (map as Map<String, dynamic>)['date'] as String,
                ),
                'value': Variable(
                  accessor:
                      (map) => (map as Map<String, dynamic>)['value'] as num,
                  scale: LinearScale(min: 0, max: 10000),
                ),
              },
              marks: [
                LineMark(
                  position: Varset('date') * Varset('value'),
                  color: ColorEncode(value: Colors.lightBlue),
                ),
                // 色違いのドットを打ちことで再現
                PointMark(
                  position: Varset('date') * Varset('value'),
                  shape: ShapeEncode(value: CircleShape()),
                  color: ColorEncode(value: Colors.blue),
                  size: SizeEncode(value: 10),
                ),
                PointMark(
                  position: Varset('date') * Varset('value'),
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
                  dim: Dim.y,
                  // ラベルを右端に
                  position: 1.0,
                  grid: PaintStyle(
                    strokeColor: Colors.grey,
                    strokeWidth: 1,
                    dash: [4, 2],
                  ),
                  labelMapper: (text, index, total) {
                    final numVal = double.tryParse(text ?? '');
                    final labelText =
                        (numVal == null) ? '' : commaFormat.format(numVal);
                    return LabelStyle(
                      span:
                          (_) => TextSpan(
                            text: labelText,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                      offset: const Offset(36, 0),
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
