import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:our_games_task/widgets/formField_widget.dart';

import 'bloc/game_bloc/games_bloc.dart';

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
  RangeValues _currentRangeValues = const RangeValues(0, 100);

  @override
  void initState() {
    fromController.text = _currentRangeValues.start.round().toString();
    toController.text = _currentRangeValues.end.round().toString();

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filter',
                    style: GoogleFonts.manrope(
                      color: const Color(0xffEBFF01),
                      fontWeight: FontWeight.w300,
                      fontSize: 32,
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff787B7F),
                      ),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 16),
                      child: Text(
                        'Reset',
                        style: GoogleFonts.manrope(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
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
                      onChanged: (value) {
                        setState(() {
                          _currentRangeValues = RangeValues(
                              value.isEmpty ? 0 : double.parse(value),
                              _currentRangeValues.end);
                        });
                      }),
                  FormFieldWidget(
                      labelText: "To",
                      controller: toController,
                      onChanged: (value) {
                        setState(() {
                          _currentRangeValues = RangeValues(
                              _currentRangeValues.start,
                              value.isEmpty ? 0 : double.parse(value));
                        });
                      }),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              RangeSlider(
                values: _currentRangeValues,
                max: 100,
                divisions: 100,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                    fromController.text = values.start.round().toString();
                    toController.text = values.end.round().toString();
                  });
                },
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  widget.successCallback(int.parse(fromController.text),
                      int.parse(toController.text));
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xffEBFF01),
                      borderRadius: BorderRadius.circular(32)),
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
