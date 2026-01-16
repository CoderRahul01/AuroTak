import 'package:hive/hive.dart';

part 'check_in.g.dart';

@HiveType(typeId: 0)
class CheckIn extends HiveObject {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final int energy;

  @HiveField(2)
  final int focus;

  @HiveField(3)
  final int mood;

  @HiveField(4)
  final String? note;

  CheckIn({
    required this.date,
    required this.energy,
    required this.focus,
    required this.mood,
    this.note,
  });
}
