import 'package:flutter/material.dart';
import 'package:flutter_sample_widget/models/chart_model.dart';

final Map<String, List<Map<String, dynamic>>> _dbRaw = {
  'weight': _weightRaw,
  'fat': _fatRaw,
  'walk_weekly': _walkWeeklyRaw,
  'weight_weekly': _weightWeeklyRaw,
  'fat_weekly': _fatWeeklyRaw,
  'walk_monthly': _walkMonthlyRaw,
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

final List<Map<String, dynamic>> _fatWeeklyRaw = [
  {'date': '日', 'value': 20},
  {'date': '月', 'value': 21},
  {'date': '火', 'value': 18},
  {'date': '水', 'value': 19},
  {'date': '木', 'value': 23},
  {'date': '金', 'value': 18},
  {'date': '土', 'value': 18},
];

final List<Map<String, dynamic>> _walkMonthlyRaw = [
  {'date': '2024-07-01', 'value': 6123},
  {'date': '2024-07-02', 'value': 7841},
  {'date': '2024-07-03', 'value': 5340},
  {'date': '2024-07-04', 'value': 8742},
  {'date': '2024-07-05', 'value': 7031},
  {'date': '2024-07-06', 'value': 6678},
  {'date': '2024-07-07', 'value': 7900},
  {'date': '2024-07-08', 'value': 8420},
  {'date': '2024-07-09', 'value': 7523},
  {'date': '2024-07-10', 'value': 6987},
  {'date': '2024-07-11', 'value': 8201},
  {'date': '2024-07-12', 'value': 5912},
  {'date': '2024-07-13', 'value': 6110},
  {'date': '2024-07-14', 'value': 8880},
  {'date': '2024-07-15', 'value': 7402},
  {'date': '2024-07-16', 'value': 5990},
  {'date': '2024-07-17', 'value': 6633},
  {'date': '2024-07-18', 'value': 9000},
  {'date': '2024-07-19', 'value': 7004},
  {'date': '2024-07-20', 'value': 8233},
  {'date': '2024-07-21', 'value': 7215},
  {'date': '2024-07-22', 'value': 5411},
  {'date': '2024-07-23', 'value': 6032},
  {'date': '2024-07-24', 'value': 8740},
  {'date': '2024-07-25', 'value': 7821},
  {'date': '2024-07-26', 'value': 6900},
  {'date': '2024-07-27', 'value': 8123},
  {'date': '2024-07-28', 'value': 6599},
  {'date': '2024-07-29', 'value': 7012},
  {'date': '2024-07-30', 'value': 7310},
  {'date': '2024-07-31', 'value': 8050},
];

final List<SleepDayData> mockSleepWeekData = [
  SleepDayData(
    weekday: '月',
    sessions: [
      SleepSession(
        startTime: const TimeOfDay(hour: 23, minute: 0),
        endTime: const TimeOfDay(hour: 6, minute: 30),
      ),
    ],
  ),
  SleepDayData(
    weekday: '火',
    sessions: [
      SleepSession(
        startTime: const TimeOfDay(hour: 0, minute: 30),
        endTime: const TimeOfDay(hour: 6, minute: 45),
      ),
      SleepSession(
        startTime: const TimeOfDay(hour: 13, minute: 0),
        endTime: const TimeOfDay(hour: 13, minute: 45),
      ),
    ],
  ),
  SleepDayData(
    weekday: '水',
    sessions: [
      SleepSession(
        startTime: const TimeOfDay(hour: 1, minute: 15),
        endTime: const TimeOfDay(hour: 7, minute: 0),
      ),
    ],
  ),
  SleepDayData(
    weekday: '木',
    sessions: [
      SleepSession(
        startTime: const TimeOfDay(hour: 0, minute: 0),
        endTime: const TimeOfDay(hour: 5, minute: 30),
      ),
      SleepSession(
        startTime: const TimeOfDay(hour: 14, minute: 0),
        endTime: const TimeOfDay(hour: 14, minute: 30),
      ),
    ],
  ),
  SleepDayData(
    weekday: '金',
    sessions: [
      SleepSession(
        startTime: const TimeOfDay(hour: 23, minute: 45),
        endTime: const TimeOfDay(hour: 7, minute: 15),
      ),
    ],
  ),
  SleepDayData(
    weekday: '土',
    sessions: [
      SleepSession(
        startTime: const TimeOfDay(hour: 2, minute: 0),
        endTime: const TimeOfDay(hour: 10, minute: 0),
      ),
    ],
  ),
  SleepDayData(
    weekday: '日',
    sessions: [
      SleepSession(
        startTime: const TimeOfDay(hour: 1, minute: 0),
        endTime: const TimeOfDay(hour: 9, minute: 30),
      ),
    ],
  ),
];

final List<ChartDate> mockWeightData =
    (_dbRaw['weight'] ?? []).map((e) => ChartDate.fromJson(e)).toList();

final List<ChartDate> mockFatData =
    (_dbRaw['fat'] ?? []).map((e) => ChartDate.fromJson(e)).toList();

final List<ChartDate> mockWalkWeeklyData =
    (_dbRaw['walk_weekly'] ?? []).map((e) => ChartDate.fromJson(e)).toList();

final List<ChartDate> mockWeightWeeklyData =
    (_dbRaw['weight_weekly'] ?? []).map((e) => ChartDate.fromJson(e)).toList();

final List<ChartDate> mockFatWeeklyData =
    (_dbRaw['fat_weekly'] ?? []).map((e) => ChartDate.fromJson(e)).toList();

final List<ChartDate> mockWalkMonthlyData =
    (_dbRaw['walk_monthly'] ?? []).map((e) => ChartDate.fromJson(e)).toList();

final List<Map<String, dynamic>> combinedWeeklyData = _combineWeekly();

List<Map<String, dynamic>> _combineWeekly() {
  final List<Map<String, dynamic>> result = [];
  for (int i = 0; i < _weightWeeklyRaw.length; i++) {
    final date = _weightWeeklyRaw[i]['date'];
    final weight = _weightWeeklyRaw[i]['value'];
    final fat = _fatWeeklyRaw[i]['value'];
    result.add({'date': date, 'weight': weight, 'fat': fat});
  }
  return result;
}
