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
