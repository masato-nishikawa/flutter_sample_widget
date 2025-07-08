import '../models/chart_data.dart';

final Map<String, List<Map<String, dynamic>>> _dbRaw = {
  'weight': _weightRaw,
  'fat': _fatRaw,
  'walk': _walkWeeklyRaw,
  'weight_weekly': _weightWeeklyRaw,
  'fat_weekly': _FatWeeklyRaw,
};

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

final List<Map<String, dynamic>> _walkWeeklyRaw = [
  {'date': '日', 'value': 3000},
  {'date': '月', 'value': 5000},
  {'date': '火', 'value': 8000},
  {'date': '水', 'value': 4800},
  {'date': '木', 'value': 8700},
  {'date': '金', 'value': 3000},
  {'date': '土', 'value': 5000},
];

final List<Map<String, dynamic>> _weightWeeklyRaw = [
  {'date': '日', 'value': 65},
  {'date': '月', 'value': 60},
  {'date': '火', 'value': 63},
  {'date': '水', 'value': 61},
  {'date': '木', 'value': 58},
  {'date': '金', 'value': 60},
  {'date': '土', 'value': 62},
];

final List<Map<String, dynamic>> _FatWeeklyRaw = [
  {'date': '日', 'value': 20},
  {'date': '月', 'value': 21},
  {'date': '火', 'value': 18},
  {'date': '水', 'value': 19},
  {'date': '木', 'value': 23},
  {'date': '金', 'value': 18},
  {'date': '土', 'value': 18},
];

final List<ChartDate> mockWeightData =
    (_dbRaw['weight'] ?? []).map((e) => ChartDate.fromJson(e)).toList();

final List<ChartDate> mockFatData =
    (_dbRaw['fat'] ?? []).map((e) => ChartDate.fromJson(e)).toList();

final List<ChartDate> mockWalkWeeklyData =
    (_dbRaw['walk'] ?? []).map((e) => ChartDate.fromJson(e)).toList();

final List<ChartDate> mockWeightWeeklyData =
    (_dbRaw['weight_weekly'] ?? []).map((e) => ChartDate.fromJson(e)).toList();

final List<ChartDate> mockFatWeeklyData =
    (_dbRaw['fat_weekly'] ?? []).map((e) => ChartDate.fromJson(e)).toList();

final List<Map<String, dynamic>> combinedWeeklyData = _combineWeekly();

List<Map<String, dynamic>> _combineWeekly() {
  final List<Map<String, dynamic>> result = [];
  for (int i = 0; i < _weightWeeklyRaw.length; i++) {
    final date = _weightWeeklyRaw[i]['date'];
    final weight = _weightWeeklyRaw[i]['value'];
    final fat = _FatWeeklyRaw[i]['value'];
    result.add({'date': date, 'weight': weight, 'fat': fat});
  }
  return result;
}
