import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seat_booking_app/constants.dart';
import 'package:seat_booking_app/widgets/custom_result_dialog.dart';

import '../pages/home_page.dart';

class Seat extends StatelessWidget {
  final int seatNumber;
  final bool isLeft;
  final int chosenSeatNumber;
  final Tier tier;

  const Seat({
    Key? key,
    required this.seatNumber,
    required this.isLeft,
    required this.chosenSeatNumber,
    required this.tier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? berthType;

    if (tier == Tier.tier3) {
      if (seatNumber % 8 == 1 || seatNumber % 8 == 4) {
        berthType = 'LOWER';
      } else if (seatNumber % 8 == 2 || seatNumber % 8 == 5) {
        berthType = 'MIDDLE';
      } else if (seatNumber % 8 == 3 || seatNumber % 8 == 6) {
        berthType = 'UPPER';
      } else if (seatNumber % 8 == 7) {
        berthType = 'SIDE LOWER';
      } else {
        berthType = 'SIDE UPPER';
      }
    }

    if (tier == Tier.tier2) {
      if (seatNumber % 6 == 1 || seatNumber % 6 == 3) {
        berthType = 'LOWER';
      } else if (seatNumber % 6 == 2 || seatNumber % 6 == 4) {
        berthType = 'UPPER';
      } else if (seatNumber % 6 == 5) {
        berthType = 'SIDE LOWER';
      } else {
        berthType = 'SIDE UPPER';
      }
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            HomePage.setSeatSelection(seatNumber);
            showDialog(
              context: context,
              builder: (context) =>
                  ResultDialog(seatNumber: seatNumber, tier: tier),
            );
          },
          child: Ink(
            padding: EdgeInsets.all(6),
            width: (tier == Tier.tier3)
                ? MediaQuery.of(context).size.width * 0.18
                : MediaQuery.of(context).size.width * 0.22,
            decoration: BoxDecoration(
              color: (chosenSeatNumber != seatNumber)
                  ? kInactiveColor
                  : kActiveColour,
              borderRadius: BorderRadius.circular(12),
            ),
            child: (isLeft)
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$seatNumber',
                        style: GoogleFonts.varelaRound(
                          color: (chosenSeatNumber != seatNumber)
                              ? Colors.white
                              : Color(0XFF0A2647),
                          fontSize: MediaQuery.of(context).size.height * 0.032,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            berthType!,
                            style: TextStyle(
                              color: (chosenSeatNumber != seatNumber)
                                  ? Colors.white
                                  : Color(0XFF0A2647),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.011,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            berthType!,
                            style: TextStyle(
                              color: (chosenSeatNumber != seatNumber)
                                  ? Colors.white
                                  : Color(0XFF0A2647),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.011,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '$seatNumber',
                        style: GoogleFonts.varelaRound(
                          color: (chosenSeatNumber != seatNumber)
                              ? Colors.white
                              : Color(0XFF0A2647),
                          fontSize: MediaQuery.of(context).size.height * 0.032,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
