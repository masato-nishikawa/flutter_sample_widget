import '../models/chart_data.dart';

final List<Map<String, dynamic>> _weightRaw = [
  { 'date': '2022-01-01', 'value': 130 },
  { 'date': '2022-04-01', 'value': 125 },
  { 'date': '2022-07-01', 'value': 128 },
  { 'date': '2022-10-01', 'value': 135 },
];

final List<Map<String, dynamic>> _fatRaw = [
  { 'date': '2022-01-01', 'value': 25.0 },
  { 'date': '2022-04-01', 'value': 24.5 },
  { 'date': '2022-07-01', 'value': 23.2 },
  { 'date': '2022-10-01', 'value': 22.8 },
];

final List<ChartDate> mockWeightData =
    _weightRaw.map((e) => ChartDate.fromJson(e)).toList();

final List<ChartDate> mockFatData =
    _fatRaw.map((e) => ChartDate.fromJson(e)).toList();