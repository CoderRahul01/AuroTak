import 'package:flutter/material.dart';
import 'package:myapp/data/models/check_in.dart';
import 'package:myapp/data/storage/hive_service.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  _CheckInScreenState createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  final PageController _pageController = PageController();
  double _energy = 5;
  double _focus = 5;
  double _mood = 5;
  final TextEditingController _noteController = TextEditingController();

  void _saveCheckIn() async {
    final newCheckIn = CheckIn(
      date: DateTime.now(),
      energy: _energy.toInt(),
      focus: _focus.toInt(),
      mood: _mood.toInt(),
      note: _noteController.text,
    );
    await HiveService().addCheckIn(newCheckIn);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Check-In"),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          _buildSliderPage(
            title: "How's your energy?",
            value: _energy,
            onChanged: (val) => setState(() => _energy = val),
          ),
          _buildSliderPage(
            title: "How's your focus?",
            value: _focus,
            onChanged: (val) => setState(() => _focus = val),
          ),
          _buildSliderPage(
            title: "How's your mood?",
            value: _mood,
            onChanged: (val) => setState(() => _mood = val),
          ),
          _buildNotePage(),
        ],
      ),
    );
  }

  Widget _buildSliderPage({
    required String title,
    required double value,
    required ValueChanged<double> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          Slider(
            value: value,
            min: 1,
            max: 10,
            divisions: 9,
            label: value.round().toString(),
            onChanged: onChanged,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }

  Widget _buildNotePage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Anything to note?", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          TextField(
            controller: _noteController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Optional note',
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _saveCheckIn,
            child: const Text('Save Check-In'),
          ),
        ],
      ),
    );
  }
}
