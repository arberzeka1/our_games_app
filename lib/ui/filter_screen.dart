import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:our_games_task/widgets/formField_widget.dart';

import '../bloc/game_bloc/games_bloc.dart';

class FilterGames extends StatefulWidget {
  final Function(int? from, int? to) successCallback;
  const FilterGames({Key? key, required this.successCallback})
      : super(key: key);

  @override
  State<FilterGames> createState() => _FilterGamesState();
}

class _FilterGamesState extends State<FilterGames> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  @override
  void initState() {
    fromController.text = "0";
    toController.text = "100";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamesBloc, GamesState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: const Color(0xff192431),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Filter',
                style: GoogleFonts.manrope(
                  color: const Color(0xffEBFF01),
                  fontWeight: FontWeight.w300,
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Price',
                style: GoogleFonts.manrope(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FormFieldWidget(
                    labelText: "From",
                    controller: fromController,
                  ),
                  FormFieldWidget(
                    labelText: "To",
                    controller: toController,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.of(context).pop();
                  await widget.successCallback(int.parse(fromController.text),
                      int.parse(toController.text));
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffEBFF01),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Center(
                    child: Text(
                      'Show Results',
                      style: GoogleFonts.manrope(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
