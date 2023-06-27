import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show debugPrint, immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:our_games_task/bloc/enum/game_status.dart';
import 'package:our_games_task/models/game_model.dart';
import 'package:our_games_task/service/game_service.dart';

part 'games_events.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvents, GamesState> {
  int page = 0;
  GamesBloc() : super(const GamesState()) {
    on<GameFetch>(
      _onGameFetch,
      transformer: droppable(),
    );
    on<GameRefresh>(
      _onGameRefresh,
      transformer: droppable(),
    );
    on<GameFilter>(
      _onGameFilter,
      transformer: droppable(),
    );
  }
  final GameService _gameService = GameService.instance;

  Future<void> _onGameFetch(
    GameFetch event,
    Emitter<GamesState> emit,
  ) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      List<GameModel> games = [];
      await getGames().then((value) {
        games = value;
      });
      return emit(
        state.copyWith(
          games: games,
          status: GameStatus.success,
          hasReachedMax: false,
        ),
      );
    }
    try {
      if (state.hasReachedMax) return;
      if (state.status == GameStatus.initial) {
        final games = await _gameService.fetchGames(
          lowerPrice: event.from,
          upperPrice: event.to,
        );
        saveNotes(games);
        return emit(
          state.copyWith(
            games: games,
            status: GameStatus.success,
            hasReachedMax: false,
            pageNumber: page,
          ),
        );
      }

      page++;
      final games = await _gameService.fetchGames(
        pageNumber: page,
        lowerPrice: event.from,
        upperPrice: event.to,
      );

      saveNotes(games);
      if (games.isEmpty) {
        return emit(state.copyWith(hasReachedMax: true));
      } else {
        return emit(
          state.copyWith(
            games: List.of(state.games!)..addAll(games),
            hasReachedMax: false,
            pageNumber: page,
          ),
        );
      }
    } catch (e) {
      debugPrint("[GameBloc] OR [_onGamesFetch] --> $e");
      return emit(state.copyWith(status: GameStatus.error));
    }
  }

  Future<void> _onGameFilter(
    GameFilter event,
    Emitter<GamesState> emit,
  ) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      List<GameModel> games = [];
      await getGames().then((value) {
        games = value;
      });
      return emit(
        state.copyWith(
          games: games,
          status: GameStatus.success,
          hasReachedMax: false,
        ),
      );
    }
    try {
      if (state.hasReachedMax) return;

      final games = await _gameService.fetchGames(
        pageNumber: page,
        upperPrice: event.to,
        lowerPrice: event.from,
      );

      if (games.isEmpty) {
        return emit(state.copyWith(hasReachedMax: true));
      } else {
        return emit(
          state.copyWith(
            games: List.of(games)..addAll(games),
            hasReachedMax: false,
          ),
        );
      }
    } catch (e) {
      debugPrint("[GameBloc] OR [_onGamesFetch] --> $e");
      return emit(state.copyWith(status: GameStatus.error));
    }
  }

  FutureOr<void> _onGameRefresh(
      GameRefresh event, Emitter<GamesState> emit) async {
    emit(const GamesState());
    await Future.delayed(const Duration(seconds: 1));
    add(const GameFetch());
  }

  Future<List<GameModel>> saveNotes(
    List<GameModel> games,
  ) async {
    try {
      final Box<GameModel> box = await Hive.openBox("GameModelHive");
      await box.clear();
      await box.addAll(games);
      return box.values.toList();
    } catch (e) {
      debugPrint("$e");
      return [];
    }
  }

  Future<List<GameModel>> getGames() async {
    try {
      final Box<GameModel> box = await Hive.openBox("GameModelHive");
      return box.values.toList();
    } catch (e) {
      debugPrint("$e");
      return [];
    }
  }
}
