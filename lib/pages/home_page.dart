import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seat_booking_app/constants.dart';
import 'package:seat_booking_app/widgets/custom_alert_box.dart';
import 'package:seat_booking_app/widgets/custom_result_dialog.dart';
import '../widgets/compartment_card.dart';

enum Tier {
  tier2,
  tier3;
}

class HomePage extends StatefulWidget {
  static var _seatSelection = ValueNotifier<int>(-1);
  const HomePage({super.key});

  static void setSeatSelection(int seatNumber) {
    _seatSelection.value = seatNumber;
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _seatNumberController;

  Tier selectedTier = Tier.tier3;

  @override
  void initState() {
    _seatNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _seatNumberController.dispose();
    super.dispose();
  }

  void showAlert(BuildContext context, int seatSelection, Tier tier) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          content: CustomAlertBox(
        tier: tier,
      )),
    );
    setState(() {
      seatSelection = seatSelection;
    });
  }

  void showSelection(BuildContext context, int seatNumber) {
    if (seatNumber == -1) {
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return ResultDialog(seatNumber: seatNumber, tier: selectedTier);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColour,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Seat Finder',
                    style: GoogleFonts.lato(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PopupMenuButton<Tier>(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.blue,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: kActiveColour,
                      size: 36,
                    ),
                    elevation: 4,
                    initialValue: selectedTier,
                    // Callback that sets the selected popup menu item.
                    onSelected: (Tier tier) {
                      setState(() {
                        selectedTier = tier;
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<Tier>>[
                      const PopupMenuItem<Tier>(
                        value: Tier.tier2,
                        child: Text('AC 2 Tier (2A)'),
                      ),
                      const PopupMenuItem<Tier>(
                        value: Tier.tier3,
                        child: Text('AC 3 Tier (3A)'),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          controller: _seatNumberController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter Seat Number...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      ),
                      Hero(
                        tag: 'Find Button',
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kActiveColour,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            setState(() {
                              try {
                                HomePage._seatSelection.value =
                                    int.parse(_seatNumberController.text);

                                int chosenSeatNumber =
                                    HomePage._seatSelection.value;
                                if (selectedTier == Tier.tier3 &&
                                    (chosenSeatNumber < 1 ||
                                        chosenSeatNumber > 32)) {
                                  showAlert(
                                      context, chosenSeatNumber, Tier.tier3);
                                } else if (selectedTier == Tier.tier2 &&
                                    (chosenSeatNumber < 1 ||
                                        chosenSeatNumber > 24)) {
                                  showAlert(
                                      context, chosenSeatNumber, Tier.tier2);
                                } else {
                                  showSelection(context, chosenSeatNumber);
                                }
                              } on FormatException {
                                showAlert(
                                  context,
                                  HomePage._seatSelection as int,
                                  selectedTier,
                                );
                              }
                            });
                          },
                          child: Center(
                            child: Text(
                              'Find',
                              style: GoogleFonts.lato(
                                color: Color(0XFF0A2647),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: HomePage._seatSelection,
                  builder: (context, value, child) {
                    return ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return CompartmentCard(
                          compartmentNum: index + 1,
                          chosenSeatNumber: value,
                          tier: selectedTier,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
