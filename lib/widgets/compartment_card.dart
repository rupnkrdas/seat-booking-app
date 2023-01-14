// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:seat_booking_app/constants.dart';
import 'package:seat_booking_app/pages/home_page.dart';
import 'package:seat_booking_app/widgets/seat_widget.dart';

class CompartmentCard extends StatelessWidget {
  final int compartmentNum;
  final int chosenSeatNumber;
  final Tier tier;
  const CompartmentCard({
    Key? key,
    required this.compartmentNum,
    required this.chosenSeatNumber,
    required this.tier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int firstSeatNum = (tier == Tier.tier3)
        ? ((compartmentNum - 1) * 8 + 1)
        : ((compartmentNum - 1) * 6 + 1);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: kCompartmentColour,
          borderRadius: BorderRadius.circular(8),
        ),
        child: (tier == Tier.tier3)
            ? Column(
                children: [
                  Row(
                    children: [
                      Seat(
                        seatNumber: firstSeatNum,
                        isLeft: true,
                        chosenSeatNumber: chosenSeatNumber,
                        tier: Tier.tier3,
                      ),
                      Seat(
                        seatNumber: firstSeatNum + 1,
                        isLeft: true,
                        chosenSeatNumber: chosenSeatNumber,
                        tier: Tier.tier3,
                      ),
                      Seat(
                        seatNumber: firstSeatNum + 2,
                        isLeft: true,
                        chosenSeatNumber: chosenSeatNumber,
                        tier: Tier.tier3,
                      ),
                      const Spacer(),
                      Seat(
                        seatNumber: firstSeatNum + 6,
                        isLeft: true,
                        chosenSeatNumber: chosenSeatNumber,
                        tier: Tier.tier3,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Seat(
                        seatNumber: firstSeatNum + 3,
                        isLeft: false,
                        chosenSeatNumber: chosenSeatNumber,
                        tier: Tier.tier3,
                      ),
                      Seat(
                        seatNumber: firstSeatNum + 4,
                        isLeft: false,
                        chosenSeatNumber: chosenSeatNumber,
                        tier: Tier.tier3,
                      ),
                      Seat(
                        seatNumber: firstSeatNum + 5,
                        isLeft: false,
                        chosenSeatNumber: chosenSeatNumber,
                        tier: Tier.tier3,
                      ),
                      const Spacer(),
                      Seat(
                        seatNumber: firstSeatNum + 7,
                        isLeft: false,
                        chosenSeatNumber: chosenSeatNumber,
                        tier: Tier.tier3,
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                children: [
                  Row(
                    children: [
                      Seat(
                        seatNumber: firstSeatNum,
                        isLeft: true,
                        chosenSeatNumber: chosenSeatNumber,
                        tier: Tier.tier2,
                      ),
                      Seat(
                        seatNumber: firstSeatNum + 1,
                        isLeft: true,
                        chosenSeatNumber: chosenSeatNumber,
                        tier: Tier.tier2,
                      ),
                      const Spacer(),
                      Seat(
                        seatNumber: firstSeatNum + 4,
                        isLeft: true,
                        chosenSeatNumber: chosenSeatNumber,
                        tier: Tier.tier2,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Seat(
                        seatNumber: firstSeatNum + 2,
                        isLeft: false,
                        chosenSeatNumber: chosenSeatNumber,
                        tier: Tier.tier2,
                      ),
                      Seat(
                        seatNumber: firstSeatNum + 3,
                        isLeft: false,
                        chosenSeatNumber: chosenSeatNumber,
                        tier: Tier.tier2,
                      ),
                      const Spacer(),
                      Seat(
                        seatNumber: firstSeatNum + 5,
                        isLeft: false,
                        chosenSeatNumber: chosenSeatNumber,
                        tier: Tier.tier2,
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
