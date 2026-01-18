import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:myapp/data/models/check_in.dart';
import 'package:myapp/data/storage/hive_service.dart';

class WeeklyInsightsScreen extends StatefulWidget {
  const WeeklyInsightsScreen({super.key});

  @override
  State<WeeklyInsightsScreen> createState() => _WeeklyInsightsScreenState();
}

class _WeeklyInsightsScreenState extends State<WeeklyInsightsScreen> {
  late final List<CheckIn> _recentCheckIns;

  @override
  void initState() {
    super.initState();
    // OPTIMIZATION: Fetch data once in initState instead of every build.
    // getLatestCheckIns involves sorting the entire dataset which is expensive.
    _recentCheckIns = HiveService().getLatestCheckIns(7).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weekly Insights')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Your Week in Review',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 10,
                    barGroups: _createBarGroups(_recentCheckIns),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 28, interval: 2)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            final index = value.toInt();
                            if (index >= 0 && index < _recentCheckIns.length) {
                              final date = _recentCheckIns[index].date;
                              return Text('${date.month}/${date.day}');
                            } else {
                              return const Text('');
                            }
                          },
                        ),
                      ),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Latest Check-Ins',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              ..._recentCheckIns.map((checkIn) => Card(
                child: ListTile(
                  title: Text('${checkIn.date.month}/${checkIn.date.day}/${checkIn.date.year}'),
                  subtitle: Text(
                    'Energy: ${checkIn.energy}, Focus: ${checkIn.focus}, Mood: ${checkIn.mood}',
                  ),
                  trailing: checkIn.note?.isNotEmpty == true ? const Icon(Icons.note) : null,
                  onTap: () {
                    if (checkIn.note?.isNotEmpty == true) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Note'),
                          content: Text(checkIn.note!),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _createBarGroups(List<CheckIn> checkIns) {
    return List.generate(checkIns.length, (index) {
      final checkIn = checkIns[index];
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(toY: checkIn.energy.toDouble(), color: Colors.blue, width: 8),
          BarChartRodData(toY: checkIn.focus.toDouble(), color: Colors.green, width: 8),
          BarChartRodData(toY: checkIn.mood.toDouble(), color: Colors.orange, width: 8),
        ],
      );
    });
  }
}
