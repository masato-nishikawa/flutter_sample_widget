import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:flutter_sample_widget/mocks/chart_mock.dart';

class RadarChartGraphic extends StatelessWidget {
  const RadarChartGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Chart(
      data: mockRadarData,
      variables: {
        'date': Variable(
          accessor: (map) => (map as Map<String, dynamic>)['date'] as String,
          scale: OrdinalScale(),
        ),
        'value': Variable(
          accessor: (map) => (map as Map<String, dynamic>)['value'] as num,
          scale: LinearScale(min: 0, max: 5),
        ),
      },
      coord: PolarCoord(transposed: true),
      marks: [
        LineMark(
          position: Varset('date') * Varset('value'),
          color: ColorEncode(value: Colors.blue),
          shape: ShapeEncode(value: BasicLineShape()),
        ),
        AreaMark(
          position: Varset('date') * Varset('value'),
          color: ColorEncode(value: Colors.blue),
          shape: ShapeEncode(value: BasicAreaShape()),
        ),
      ],
      axes: [Defaults.radialAxis, Defaults.circularAxis],
    );
  }
}
