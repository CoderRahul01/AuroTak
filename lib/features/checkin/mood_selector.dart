import 'package:flutter/material.dart';

class MoodSelector extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const MoodSelector({super.key, required this.onChanged});

  @override
  State<MoodSelector> createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {
  int _selectedIndex = 2;

  final List<IconData> _moodIcons = [
    Icons.sentiment_very_dissatisfied,
    Icons.sentiment_dissatisfied,
    Icons.sentiment_neutral,
    Icons.sentiment_satisfied,
    Icons.sentiment_very_satisfied,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(_moodIcons[index]),
          iconSize: 40,
          color: _selectedIndex == index ? Theme.of(context).colorScheme.primary : Colors.grey,
          onPressed: () {
            setState(() {
              _selectedIndex = index;
            });
            widget.onChanged(index + 1);
          },
        );
      }),
    );
  }
}
