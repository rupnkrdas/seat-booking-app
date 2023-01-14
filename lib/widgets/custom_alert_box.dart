import 'package:flutter/material.dart';
import 'package:seat_booking_app/pages/home_page.dart';

class CustomAlertBox extends StatelessWidget {
  final Tier tier;
  const CustomAlertBox({super.key, required this.tier});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 80),
      alignment: Alignment.center,
      decoration: const BoxDecoration(),
      child: Text(
        (tier == Tier.tier3)
            ? "Please choose a valid seat number between 1 and 32"
            : 'Please choose a valid seat number between 1 and 24',
        textAlign: TextAlign.center,
      ),
    );
  }
}
