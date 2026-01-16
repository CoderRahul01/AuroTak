import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:myapp/data/models/check_in.dart';
import 'package:myapp/data/storage/hive_service.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CheckIn> checkIns = HiveService().getAllCheckIns();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Check-In History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    _buildLineChartBarData(checkIns, (checkIn) => checkIn.energy, Colors.red),
                    _buildLineChartBarData(checkIns, (checkIn) => checkIn.focus, Colors.blue),
                    _buildLineChartBarData(checkIns, (checkIn) => checkIn.mood, Colors.green),
                  ],
                  titlesData: const FlTitlesData(
                    bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 40)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: const FlGridData(show: true),
                  borderData: FlBorderData(show: true),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: checkIns.length,
                itemBuilder: (context, index) {
                  final checkIn = checkIns[index];
                  return ListTile(
                    title: Text(checkIn.date.toIso8601String()),
                    subtitle: Text('Energy: ${checkIn.energy}, Focus: ${checkIn.focus}, Mood: ${checkIn.mood}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartBarData _buildLineChartBarData(List<CheckIn> checkIns, int Function(CheckIn) getValue, Color color) {
    return LineChartBarData(
      spots: checkIns.asMap().entries.map((entry) {
        final index = entry.key;
        final checkIn = entry.value;
        return FlSpot(index.toDouble(), getValue(checkIn).toDouble());
      }).toList(),
      isCurved: true,
      color: color,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
    );
  }
}
