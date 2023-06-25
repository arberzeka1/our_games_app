import 'package:dio/dio.dart';
import 'package:our_games_task/core/constants/service_constants.dart';
import 'package:our_games_task/models/game_model.dart';

class GameService {
  static final GameService _instance = GameService._init();
  static GameService get instance => _instance;
  GameService._init();

  final _constants = ServiceConstants.instance;
  final Dio _dio = Dio();

  Future<List<GameModel>> fetchGames(
      {int start = 0,
      int pageNumber = 0,
      int pageSize = 10,
      int upperPrice = 50,
      int lowerPrice = 0}) async {
    String url =
        '${_constants.baseUrl}&pageNumber=$pageNumber&pageSize=${_constants.pageSize}&lowerPrice=$lowerPrice&upperPrice=$upperPrice';

    final response = await _dio.get(url);

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => GameModel.fromJson(e))
          .cast<GameModel>()
          .toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
