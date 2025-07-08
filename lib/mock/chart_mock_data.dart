import '../models/chart_data.dart';

final List<Map<String, dynamic>> _weightRaw = [
  {'date': '2022-01-01', 'value': 75},
  {'date': '2022-04-01', 'value': 72.5},
  {'date': '2022-07-01', 'value': 68},
  {'date': '2022-10-01', 'value': 73},
];

final List<Map<String, dynamic>> _fatRaw = [
  {'date': '2022-01-01', 'value': 25.0},
  {'date': '2022-04-01', 'value': 24.5},
  {'date': '2022-07-01', 'value': 23.2},
  {'date': '2022-10-01', 'value': 22.8},
];

final Map<String, List<Map<String, dynamic>>> _dbRaw = {
  'weight': _weightRaw,
  'fat': _fatRaw,
};

final List<ChartDate> mockWeightData =
    (_dbRaw['weight'] ?? []).map((e) => ChartDate.fromJson(e)).toList();

final List<ChartDate> mockFatData =
    (_dbRaw['fat'] ?? []).map((e) => ChartDate.fromJson(e)).toList();
