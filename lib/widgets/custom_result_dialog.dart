import 'package:flutter/material.dart';
import 'package:seat_booking_app/constants.dart';

import '../pages/home_page.dart';

class ResultDialog extends StatelessWidget {
  final int seatNumber;
  final Tier tier;
  const ResultDialog({super.key, required this.seatNumber, required this.tier});

  @override
  Widget build(BuildContext context) {
    String berthType = 'LOWER';
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
    return Hero(
      tag: 'Find Button',
      child: Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)), //this right here
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Image.asset(
                    "assets/images/icons8-train-ticket-96.png",
                  ),
                ),
                Text(
                  '$berthType\nBERTH',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kActiveColour,
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
