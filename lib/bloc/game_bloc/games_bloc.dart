import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show debugPrint, immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_games_task/bloc/enum/game_status.dart';
import 'package:our_games_task/models/game_model.dart';
import 'package:our_games_task/service/game_service.dart';

part 'games_events.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvents, GamesState> {
  GamesBloc() : super(const GamesState()) {
    on<GameFetch>(
      _onGameFetch,
      transformer: droppable(),
    );
    on<GameRefresh>(
      _onGameRefresh,
      transformer: droppable(),
    );
  }
  final GameService _gameService = GameService.instance;

  Future<void> _onGameFetch(
    GameFetch event,
    Emitter<GamesState> emitter,
  ) async {
    try {
      if (state.hasReachedMax) return;
      if (state.status == GameStatus.initial) {
        final games = await _gameService.fetchGames();
        return emit(
          state.copyWith(
            games: games,
            status: GameStatus.success,
            hasReachedMax: false,
          ),
        );
      }
      final games = await _gameService.fetchGames(state.games!.length);
      if (games.isEmpty) {
        return emit(state.copyWith(hasReachedMax: true));
      } else {
        return emit(
          state.copyWith(
            games: List.of(state.games!)..addAll(games),
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
}
