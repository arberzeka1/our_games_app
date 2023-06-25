part of 'games_bloc.dart';

class GamesState extends Equatable {
  final List<GameModel>? games;
  final GameStatus status;
  final bool hasReachedMax;
  final int pageNumber;
  final int from;
  final int to;

  const GamesState({
    this.games,
    this.status = GameStatus.initial,
    this.hasReachedMax = false,
    this.pageNumber = 0,
    this.from = 0,
    this.to = 50,
  });

  GamesState copyWith({
    List<GameModel>? games,
    GameStatus? status,
    bool? hasReachedMax,
    int? pageNumber,
    int? from,
    int? to,
  }) {
    return GamesState(
      games: games ?? this.games,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      pageNumber: pageNumber ?? this.pageNumber,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  @override
  List<Object?> get props =>
      [games, status, hasReachedMax, pageNumber, from, to];
}
