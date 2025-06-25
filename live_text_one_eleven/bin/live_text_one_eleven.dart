import 'dart:convert';

void main() {
  List<Map<String, dynamic>> students = [
    {"name": "Alice", "scores": [85, 90, 78]},
    {"name": "Bob", "scores": [88, 76, 95]},
    {"name": "Charlie", "scores": [90, 92, 85]},
    {"name": "Daniel", "scores": [33, 45, 34]}
  ];

  Map<String, double> averageScores = {};

  for (var student in students) {
    String name = student['name'];
    List<int> scores = List<int>.from(student['scores']);
    double average = scores.reduce((a, b) => a + b) / scores.length;
    averageScores[name] = double.parse(average.toStringAsFixed(2));
  }

  var sortedEntries = averageScores.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  Map<String, double> sortedAverageScores = {
    for (var entry in sortedEntries) entry.key: entry.value
  };

  const encoder = JsonEncoder.withIndent('  ');
  String prettyOutput = encoder.convert(sortedAverageScores);

  print(prettyOutput);
}
