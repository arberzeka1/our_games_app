import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_games_task/bloc/game_bloc/games_bloc.dart';
import 'package:our_games_task/bloc/observers/game_bloc_observer.dart';
import 'package:our_games_task/game.dart';

void main() {
  Bloc.observer = GameBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GamesBloc>(
      create: (BuildContext context) => GamesBloc()..add(const GameFetch()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Game(),
      ),
    );
  }
}
