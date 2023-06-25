import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:our_games_task/bloc/enum/game_status.dart';
import 'package:our_games_task/bloc/game_bloc/games_bloc.dart';
import 'package:our_games_task/filter_screen.dart';
import 'package:our_games_task/game_details.dart';
import 'package:our_games_task/home_error_view.dart';

import 'custom_circular_progress_indicator.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    // print("on scroll");//
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      print('pss');
      context.read<GamesBloc>().add(const GameFetch());
    }
  }

  void callFilter() {
    context.read<GamesBloc>().add(const GameFetch());
  }

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      backgroundColor: const Color(0xff1D2635),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Game List',
                      style: GoogleFonts.manrope(
                          color: const Color(0xffEBFF01),
                          fontWeight: FontWeight.w300,
                          fontSize: 32),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return FilterGames(
                            successCallback: (int? from, int? to) {
                              callFilter();
                            },
                          );
                        }));
                      },
                      child: const Icon(
                        Icons.sort,
                        size: 24,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Find the best prices on digital game.  We have just what you\'re looking for!',
                  style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            BlocBuilder<GamesBloc, GamesState>(
              builder: (context, state) {
                if (state.status == GameStatus.initial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.status == GameStatus.success) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<GamesBloc>().add(const GameRefresh());
                    },
                    child: state.games!.isEmpty
                        ? const Center(
                            child: Text(
                              'No DATA in List',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.75,
                            child: ListView.builder(
                              // shrinkWrap: true,
                              controller: _scrollController,
                              itemCount: state.hasReachedMax
                                  ? state.games!.length
                                  : state.games!.length + 1,
                              itemBuilder: (context, index) {
                                return index >= state.games!.length
                                    ? const Center(
                                        child:
                                            CustomCircularProgressIndicator(),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    GameDetails(
                                                        game: state
                                                            .games![index]),
                                              ),
                                            );
                                          },
                                          child: SizedBox(
                                            height: 120,
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                      height: 100,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xff263343),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 100.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              state
                                                                  .games![index]
                                                                  .title!,
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade,
                                                              maxLines: 1,
                                                              style: GoogleFonts
                                                                  .manrope(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            RatingBar.builder(
                                                              initialRating:
                                                                  double.parse(state
                                                                          .games![
                                                                              index]
                                                                          .steamRatingPercent!) /
                                                                      20,
                                                              minRating: 0,
                                                              direction: Axis
                                                                  .horizontal,
                                                              allowHalfRating:
                                                                  true,
                                                              itemCount: 5,
                                                              itemSize: 13,
                                                              unratedColor:
                                                                  Colors.white,
                                                              itemPadding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 2.0,
                                                              ),
                                                              itemBuilder:
                                                                  (context,
                                                                          _) =>
                                                                      const Icon(
                                                                Icons.star,
                                                                color: Color(
                                                                    0xffEBFF01),
                                                                size: 13,
                                                              ),
                                                              onRatingUpdate:
                                                                  (rating) {},
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                if (state
                                                                        .games![
                                                                            index]
                                                                        .isOnSale! ==
                                                                    "1")
                                                                  Text(
                                                                    '${state.games![index].normalPrice!}€',
                                                                    style: GoogleFonts
                                                                        .manrope(
                                                                      color: const Color(
                                                                          0xff6B7480),
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .lineThrough,
                                                                      decorationThickness:
                                                                          2,
                                                                      decorationStyle:
                                                                          TextDecorationStyle
                                                                              .solid,
                                                                      decorationColor:
                                                                          const Color(
                                                                              0xff6B7480),
                                                                    ),
                                                                  ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  state.games![index]
                                                                              .isOnSale! ==
                                                                          "1"
                                                                      ? '${state.games![index].salePrice!}€'
                                                                      : '${state.games![index].normalPrice!}€',
                                                                  style: GoogleFonts
                                                                      .manrope(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: -20,
                                                  left: -20,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: SizedBox(
                                                      height: 100,
                                                      width: 100,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: state
                                                              .games![index]
                                                              .thumb!,
                                                          fit: BoxFit.cover,
                                                          progressIndicatorBuilder:
                                                              (context, url,
                                                                      progress) =>
                                                                  Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              value: progress
                                                                  .progress,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ); //buildTodo(context, state, index);
                              },
                            ),
                          ),
                  );
                } else {
                  return const HomeErrorView();
                }
              },
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
