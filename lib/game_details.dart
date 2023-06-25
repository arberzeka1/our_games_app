import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:our_games_task/models/game_model.dart';
import 'package:our_games_task/widgets/store_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class GameDetails extends StatefulWidget {
  final GameModel game;
  const GameDetails({Key? key, required this.game}) : super(key: key);

  @override
  State<GameDetails> createState() => _GameDetailsState();
}

class _GameDetailsState extends State<GameDetails> {
  final List<String> storeImages = [
    "images/amazon1.png",
    "images/ebay.png",
    "images/origin.png",
    "images/ali_express.png",
  ];
  final List<String> storeName = ["Amazon", "Ebay", "Origin", "Ali"];
  final Uri _url = Uri.parse('https://www.metacritic.com/');

  String stringDate(int lastChange) {
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(lastChange * 1000);
    String stringDate = DateFormat.yMd().format(dt);
    return stringDate;
  }

  Future<void> _launchUrl(String metacriticLink) async {
    if (!await launchUrl(
        Uri.parse('https://www.metacritic.com$metacriticLink'))) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff192431),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: CachedNetworkImage(
                      imageUrl: widget.game.thumb!,
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
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
                          const Color(0xff1D2635).withOpacity(0.0),
                          const Color(0xff1D2635),
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
                          imageUrl: widget.game.thumb!,
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
                      widget.game.title!,
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
                        if (widget.game.isOnSale! == "1")
                          Text(
                            '${widget.game.normalPrice!}€',
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
                          widget.game.isOnSale! == "1"
                              ? '${widget.game.salePrice!}€'
                              : '${widget.game.normalPrice!}€',
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
                      'on ${stringDate(widget.game.lastChange!)}',
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
                          '${storeImages.length} Stores',
                          style: GoogleFonts.manrope(
                            color: const Color(0xff6B7480),
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 75,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: storeImages.length,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: StoreWidget(
                                salePrice: widget.game.salePrice!,
                                normalPrice: widget.game.normalPrice!,
                                isOnSale: widget.game.isOnSale!,
                                imageName: storeImages[index],
                                storeName: storeName[index],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              _launchUrl(widget.game.metacriticLink!);
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffEBFF01),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    initialRating:
                        double.parse(widget.game.steamRatingPercent!) / 20,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 13,
                    unratedColor: Colors.grey.shade300,
                    itemPadding: const EdgeInsets.symmetric(
                      horizontal: 2.0,
                    ),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star_border_purple500,
                      color: Colors.black,
                      size: 13,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("${widget.game.steamRatingPercent!}/100"),
                  const SizedBox(
                    width: 5,
                  ),
                  if (widget.game.steamRatingText != null)
                    Text('${widget.game.steamRatingText}'),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    size: 24,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
