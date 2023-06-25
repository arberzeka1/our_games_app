part of 'games_bloc.dart';

@immutable
abstract class GamesEvents extends Equatable {
  const GamesEvents();

  @override
  List<Object?> get props => [];
}

class GameFetch extends GamesEvents {
  const GameFetch();
}

class GameRefresh extends GamesEvents {
  const GameRefresh();
}

// class GameFilter extends GamesEvents {
//   const GameFilter();
// }
