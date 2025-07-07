import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:intl/intl.dart';

class WeightData {
  final String date; // yyyy-MM-dd
  final double weight;

  WeightData(this.date, this.weight);
}

final List<WeightData> mockWeightData = [
  WeightData('2025-07-01', 65.3),
  WeightData('2025-07-02', 65.0),
  WeightData('2025-07-03', 65.5),
  WeightData('2025-07-04', 65.1),
  WeightData('2025-07-05', 64.9),
];

class WeightChartGraphic extends StatelessWidget {
  const WeightChartGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    final data = mockWeightData.map((e) => {
      'date': DateFormat('MM/dd').format(DateTime.parse(e.date)),
      'weight': e.weight,
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            '体重の推移',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        AspectRatio(
          aspectRatio: 1.6,
          child: Chart(
            data: data,
            variables: {
              'date': Variable(
               accessor: (map) => map['date'] is String ? map['date'] : '',
              ),
              'weight': Variable(
                accessor: (map) => map['weight'] as num? ?? 0,
              ),
            },
            marks: [
              IntervalMark(
                position: Var('date') * Var('weight'),
                color: ColorEncode(value: Colors.cyan),
              ),
            ],
            axes: [
              Defaults.horizontalAxis,
              Defaults.verticalAxis,
            ],
          ),
        ),
      ],
    );
  }
}