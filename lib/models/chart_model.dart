import 'package:flutter/material.dart';

class ChartDate {
  final String date;
  final double value;

  ChartDate({required this.date, required this.value});

  factory ChartDate.fromJson(Map<String, dynamic> json) {
    return ChartDate(
      date: json['date'],
      value: (json['value'] as num).toDouble(),
    );
  }
}

class SleepSession {
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  SleepSession({required this.startTime, required this.endTime});
}

class SleepDayData {
  final String weekday; // 日〜土
  final List<SleepSession> sessions; // 複数の睡眠セッション

  SleepDayData({required this.weekday, required this.sessions});
}
