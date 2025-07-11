import 'dart:math';

import 'package:flutter/material.dart';
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

class RadarChartGraphic extends StatelessWidget {
  const RadarChartGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Chart(
      data: radarRaw,
      variables: {
        'label': Variable(
          accessor: (Map map) {
            final label = map['label'].toString();
            return label.replaceAll('　', '\n');
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
              Colors.grey.withAlpha(76),
              Colors.grey.withAlpha(76),
              Colors.grey.withAlpha(76),
              Colors.grey.withAlpha(76),
              Colors.grey.withAlpha(76),
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
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
            ],
          ),
          shape: ShapeEncode(value: BasicAreaShape()),
        ),
      ],
      coord: PolarCoord(
        startAngle: -pi / 2 - pi / 5,
        endAngle: 3 * pi / 2 - pi / 5,
      ),
      axes: [
        Defaults.circularAxis
          ..line = null
          ..label = LabelStyle(textStyle: TextStyle(color: Colors.black)),
        Defaults.radialAxis
          ..line = null
          ..grid = null
          ..label = null,
      ],
    );
  }
}

const adjustData = [
  {"type": "Email", "index": 0, "value": 120},
  {"type": "Email", "index": 1, "value": 132},
  {"type": "Email", "index": 2, "value": 101},
  {"type": "Email", "index": 3, "value": 134},
  {"type": "Email", "index": 4, "value": 90},
  {"type": "Email", "index": 5, "value": 230},
  {"type": "Email", "index": 6, "value": 210},
  {"type": "Affiliate", "index": 0, "value": 220},
  {"type": "Affiliate", "index": 1, "value": 182},
  {"type": "Affiliate", "index": 2, "value": 191},
  {"type": "Affiliate", "index": 3, "value": 234},
  {"type": "Affiliate", "index": 4, "value": 290},
  {"type": "Affiliate", "index": 5, "value": 330},
  {"type": "Affiliate", "index": 6, "value": 310},
  {"type": "Video", "index": 0, "value": 150},
  {"type": "Video", "index": 1, "value": 232},
  {"type": "Video", "index": 2, "value": 201},
  {"type": "Video", "index": 3, "value": 154},
  {"type": "Video", "index": 4, "value": 190},
  {"type": "Video", "index": 5, "value": 330},
  {"type": "Video", "index": 6, "value": 410},
  {"type": "Direct", "index": 0, "value": 320},
  {"type": "Direct", "index": 1, "value": 332},
  {"type": "Direct", "index": 2, "value": 301},
  {"type": "Direct", "index": 3, "value": 334},
  {"type": "Direct", "index": 4, "value": 390},
  {"type": "Direct", "index": 5, "value": 330},
  {"type": "Direct", "index": 6, "value": 320},
  {"type": "Search", "index": 0, "value": 320},
  {"type": "Search", "index": 1, "value": 432},
  {"type": "Search", "index": 2, "value": 401},
  {"type": "Search", "index": 3, "value": 434},
  {"type": "Search", "index": 4, "value": 390},
  {"type": "Search", "index": 5, "value": 430},
  {"type": "Search", "index": 6, "value": 420},
];

class DemoRadarChartGraphic extends StatelessWidget {
  const DemoRadarChartGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: 350,
      height: 300,
      child: Chart(
        data: adjustData,
        variables: {
          'index': Variable(accessor: (Map map) => map['index'].toString()),
          'type': Variable(accessor: (Map map) => map['type'] as String),
          'value': Variable(accessor: (Map map) => map['value'] as num),
        },
        marks: [
          LineMark(
            position: Varset('index') * Varset('value') / Varset('type'),
            // position: Varset('index') * Varset('value'),
            shape: ShapeEncode(value: BasicLineShape(loop: true)),
            color: ColorEncode(variable: 'type', values: Defaults.colors10),
          ),
        ],
        coord: PolarCoord(),
        axes: [Defaults.circularAxis, Defaults.radialAxis],
        selections: {
          'touchMove': PointSelection(
            on: {
              GestureType.scaleUpdate,
              GestureType.tapDown,
              GestureType.longPressMoveUpdate,
            },
            dim: Dim.x,
            variable: 'index',
          ),
        },
        tooltip: TooltipGuide(
          anchor: (_) => Offset.zero,
          align: Alignment.bottomRight,
          multiTuples: true,
          // variables: ['type', 'value'],
          variables: ['value'],
        ),
        crosshair: CrosshairGuide(followPointer: [false, true]),
      ),
    );
  }
}
