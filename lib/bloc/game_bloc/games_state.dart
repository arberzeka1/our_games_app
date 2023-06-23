part of 'games_bloc.dart';

class GamesState extends Equatable {
  final List<GameModel>? games;
  final GameStatus status;
  final bool hasReachedMax;

  const GamesState({
    this.games,
    this.status = GameStatus.initial,
    this.hasReachedMax = false,
  });

  GamesState copyWith({
    List<GameModel>? games,
    GameStatus? status,
    bool? hasReachedMax,
  }) {
    return GamesState(
      games: games ?? this.games,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [games, status, hasReachedMax];
}
