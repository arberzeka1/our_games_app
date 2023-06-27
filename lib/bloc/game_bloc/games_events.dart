part of 'games_bloc.dart';

@immutable
abstract class GamesEvents extends Equatable {
  const GamesEvents();

  @override
  List<Object?> get props => [];
}

class GameFetch extends GamesEvents {
  final int from;
  final int to;
  final bool fromFilter;

  const GameFetch({this.from = 0, this.to = 50, this.fromFilter = false});
}

class GameRefresh extends GamesEvents {
  const GameRefresh();
}

class GameFilter extends GamesEvents {
  final int from;
  final int to;
  final bool fromFilter;

  const GameFilter({this.from = 0, this.to = 50, this.fromFilter = false});
}
