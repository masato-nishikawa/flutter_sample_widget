import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:flutter_sample_widget/mocks/chart_mock.dart';

class SleepBarChartGraphic extends StatelessWidget {
  const SleepBarChartGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Chart(
                padding: (_) => EdgeInsets.zero,
                data: mockSleepWeeklyData,
                variables: {
                  'date': Variable(
                    accessor:
                        (map) =>
                            (map as Map<String, dynamic>)['date'] as String,
                    scale: OrdinalScale(),
                  ),
                  'start': Variable(
                    accessor:
                        (map) => (map as Map<String, dynamic>)['start'] as num,
                    scale: LinearScale(min: 24, max: 19),
                  ),
                  'end': Variable(
                    accessor:
                        (map) => (map as Map<String, dynamic>)['end'] as num,
                    scale: LinearScale(min: 24, max: 19),
                  ),
                },
                marks: [
                  IntervalMark(
                    position:
                        Varset('date') * (Varset('start') + Varset('end')),
                    color: ColorEncode(value: Colors.blue),
                  ),
                ],
                axes: [
                  Defaults.horizontalAxis..label = null,
                  Defaults.verticalAxis,
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: Chart(
                padding: (_) => EdgeInsets.zero,
                data: mockSleepWeeklyData,
                variables: {
                  'date': Variable(
                    accessor:
                        (map) =>
                            (map as Map<String, dynamic>)['date'] as String,
                    scale: OrdinalScale(),
                  ),
                  'start': Variable(
                    accessor:
                        (map) => (map as Map<String, dynamic>)['start'] as num,
                    scale: LinearScale(min: 15, max: 0),
                  ),
                  'end': Variable(
                    accessor:
                        (map) => (map as Map<String, dynamic>)['end'] as num,
                    scale: LinearScale(min: 15, max: 0),
                  ),
                },
                marks: [
                  IntervalMark(
                    position:
                        Varset('date') * (Varset('start') + Varset('end')),
                    color: ColorEncode(value: Colors.blue),
                  ),
                ],
                axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
