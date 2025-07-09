import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:flutter_sample_widget/mocks/chart_mock.dart';
import 'package:intl/intl.dart';

class WeightFatChartGraphic extends StatelessWidget {
  const WeightFatChartGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    // データを統合してグラフ用に変換
    final chartData = _prepareChartData();

    return Column(
      children: [
        // 軸タイトル
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                '体重 (kg)',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                '体脂肪率 (%)',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.all(8),
          child: Chart(
            data: chartData,
            variables: {
              'date': Variable(
                accessor: (Map map) => map['date'] as String,
                scale: OrdinalScale(tickCount: 5),
              ),
              'weight': Variable(
                accessor: (Map map) => (map['weight'] as num?) ?? 0,
              ),
              'fat': Variable(accessor: (Map map) => (map['fat'] as num?) ?? 0),
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
              // 体脂肪率の折れ線グラフ（nullでない場合のみ表示）
              LineMark(
                position: Varset('date') * Varset('fat'),
                color: ColorEncode(value: Colors.red),
                size: SizeEncode(value: 2),
              ),
              // 体脂肪率のポイント（nullでない場合のみ表示）
              PointMark(
                position: Varset('date') * Varset('fat'),
                color: ColorEncode(value: Colors.red),
                size: SizeEncode(value: 6),
              ),
            ],
            axes: [
              Defaults.horizontalAxis,
              Defaults.verticalAxis..variable = ('weight'),
              Defaults.verticalAxis
                ..variable = ('fat')
                ..position = 1.05,
            ],
          ),
        ),
      ],
    );
  }

  List<Map<String, dynamic>> _prepareChartData() {
    final Map<String, Map<String, dynamic>> combined = {};

    // 体重データを追加（日付フォーマット済み）
    for (final weightData in mockWeightData) {
      final formattedDate = _formatDate(weightData.date);
      combined[weightData.date] = {
        'date': formattedDate,
        'weight': weightData.value,
        'fat': 0, // デフォルト値
      };
    }

    // 体脂肪データを追加（日付フォーマット済み）
    for (final fatData in mockFatData) {
      final formattedDate = _formatDate(fatData.date);
      if (combined.containsKey(fatData.date)) {
        combined[fatData.date]!['date'] = formattedDate;
        combined[fatData.date]!['fat'] = fatData.value;
      } else {
        combined[fatData.date] = {
          'date': formattedDate,
          'weight': 0, // デフォルト値
          'fat': fatData.value,
        };
      }
    }

    return combined.values.toList()
      ..sort((a, b) => a['date'].compareTo(b['date']));
  }

  String _formatDate(String dateString) {
    try {
      final parsed = DateTime.parse(dateString);
      return DateFormat('MM/dd').format(parsed);
    } catch (e) {
      return dateString;
    }
  }
}

class WeightChartGraphic extends StatelessWidget {
  const WeightChartGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        mockWeightData
            .map(
              (e) => {
                'date': DateFormat('MM/dd').format(DateTime.parse(e.date)),
                'weight': e.value,
              },
            )
            .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            '体重の推移',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.all(8),
          child: Chart(
            data: data,
            variables: {
              'date': Variable(
                accessor:
                    (map) => (map as Map<String, dynamic>)['date'] as String,
              ),
              'weight': Variable(
                accessor:
                    (map) => (map as Map<String, dynamic>)['weight'] as num,
              ),
            },
            marks: [
              IntervalMark(
                position: Varset('date') * Varset('weight'),
                color: ColorEncode(value: Colors.cyan),
              ),
            ],
            axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
          ),
        ),
      ],
    );
  }
}

class FatChartGraphic extends StatelessWidget {
  const FatChartGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        mockFatData
            .map(
              (e) => {
                'date': DateFormat('MM/dd').format(DateTime.parse(e.date)),
                'fat': e.value,
              },
            )
            .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            '体脂肪率の推移',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.all(8),
          child: Chart(
            data: data,
            variables: {
              'date': Variable(
                accessor:
                    (map) => (map as Map<String, dynamic>)['date'] as String,
              ),
              'fat': Variable(
                accessor: (map) => (map as Map<String, dynamic>)['fat'] as num,
              ),
            },
            marks: [
              LineMark(
                position: Varset('date') * Varset('fat'),
                color: ColorEncode(value: Colors.pink),
              ),
              PointMark(
                position: Varset('date') * Varset('fat'),
                color: ColorEncode(value: Colors.pink),
              ),
            ],
            axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
          ),
        ),
      ],
    );
  }
}
