import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/data/models/check_in.dart';

class HiveService {
  static const String _checkInBoxName = 'checkIns';

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CheckInAdapter());
    await Hive.openBox<CheckIn>(_checkInBoxName);
  }

  Box<CheckIn> get _checkInBox => Hive.box<CheckIn>(_checkInBoxName);

  Future<void> addCheckIn(CheckIn checkIn) async {
    final box = _checkInBox;
    // Use date as key to prevent duplicates for the same day
    await box.put(checkIn.date.toIso8601String().substring(0, 10), checkIn);
  }

  CheckIn? getCheckInForDate(DateTime date) {
    final box = _checkInBox;
    return box.get(date.toIso8601String().substring(0, 10));
  }

  List<CheckIn> getLatestCheckIns(int limit) {
    final box = _checkInBox;
    final allCheckIns = box.values.toList()..sort((a, b) => b.date.compareTo(a.date));
    return allCheckIns.take(limit).toList();
  }
}
