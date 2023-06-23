import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:our_games_task/models/game_model.dart';

class GameDetails extends StatelessWidget {
  final GameModel game;
  const GameDetails({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(game.lastChange! * 1000);
    String stringDate = DateFormat.yMd().format(dt);
    return Scaffold(
      backgroundColor: const Color(0xff192431),
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: CachedNetworkImage(
                  imageUrl: game.thumb!,
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Color(0xff1D2635).withOpacity(0.0),
                      Color(0xff1D2635),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: game.thumb!,
                      height: 150,
                      width: 110,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  game.title!,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.manrope(
                    color: const Color(0xffEBFF01),
                    fontWeight: FontWeight.w300,
                    fontSize: 26,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (game.isOnSale! == "1")
                      Text(
                        '${game.normalPrice!}€',
                        style: GoogleFonts.manrope(
                          color: const Color(0xff6B7480),
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationColor: const Color(0xff6B7480),
                        ),
                      ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      game.isOnSale! == "1"
                          ? '${game.salePrice!}€'
                          : '${game.normalPrice!}€',
                      style: GoogleFonts.manrope(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'on $stringDate',
                  style: GoogleFonts.manrope(
                    color: const Color(0xff6B7480),
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Where to buy it',
                      style: GoogleFonts.manrope(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      '4 Stores',
                      style: GoogleFonts.manrope(
                        color: const Color(0xff6B7480),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
