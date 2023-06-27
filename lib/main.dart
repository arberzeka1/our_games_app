import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_games_task/bloc/game_bloc/games_bloc.dart';
import 'package:our_games_task/bloc/observers/game_bloc_observer.dart';
import 'package:our_games_task/service/hive_manager.dart';
import 'package:our_games_task/ui/game.dart';

void main() async {
  await HiveManager().init();
  Bloc.observer = GameBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GamesBloc>(
      create: (BuildContext context) => GamesBloc()..add(const GameFetch()),
      child: MaterialApp(
        title: 'Game App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Game(),
      ),
    );
  }
}
