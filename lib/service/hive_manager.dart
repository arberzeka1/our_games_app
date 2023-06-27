import 'package:hive_flutter/hive_flutter.dart';
import 'package:our_games_task/models/game_model.dart';

class HiveManager {
  static HiveManager? _instance;

  factory HiveManager() {
    _instance ??= HiveManager._init();
    return _instance!;
  }

  HiveManager._init();

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(GameModelAdapter());
  }
}
