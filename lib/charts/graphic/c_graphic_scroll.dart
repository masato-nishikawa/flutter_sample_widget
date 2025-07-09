import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:flutter_sample_widget/mocks/chart_mock.dart';
import 'package:intl/intl.dart';

final NumberFormat commaFormat = NumberFormat('#,###');

class ScrollLineChartGraphic extends StatelessWidget {
  const ScrollLineChartGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.lightBlue[50],
          height: 200, // 高さは固定 or AspectRatioでもOK
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 1200, // ← 横幅を広げる（1日40px × 30日 = 1200など）
              child: Chart(
                padding: (_) => const EdgeInsets.fromLTRB(0, 5, 50, 25),
                data:
                    mockWalkMonthlyData
                        .map((e) => {'date': e.date, 'value': e.value})
                        .toList(),
                variables: {
                  'date': Variable(
                    accessor:
                        (map) =>
                            (map as Map<String, dynamic>)['date'] as String,
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
                  AxisGuide(
                    dim: Dim.x, // ← x軸に対して
                    labelMapper: (text, index, total) {
                      try {
                        final parsed = DateTime.parse(text ?? '');
                        final formatted = DateFormat('MM/dd').format(parsed);
                        return LabelStyle(
                          span:
                              (_) => TextSpan(
                                text: formatted,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              ),
                        );
                      } catch (_) {
                        return null;
                      }
                    },
                  ),
                  AxisGuide(
                    dim: Dim.y,
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
        ),
      ],
    );
  }
}
