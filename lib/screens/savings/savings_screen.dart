import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';
import 'package:iconify_flutter/icons/iwwa.dart';

class SavingsScreen extends StatelessWidget {
  const SavingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 80,
                bottom: 20,
              ),
              child: Text(
                "Your savings this week",
                style: GoogleFonts.mulish(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 300,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 0.75),
                onEnd: () {
                  GFToast.showToast(
                    'Only 0.16€ away from your weekly goal!⭐',
                    toastBorderRadius: 5.00,
                    textStyle: GoogleFonts.mulish(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff00082e),
                    ),
                    context,
                    backgroundColor: const Color(0xFFE0E1E5),
                    toastPosition: GFToastPosition.BOTTOM,
                    toastDuration: 3,
                  );
                },
                duration: const Duration(milliseconds: 750),
                builder: (context, value, _) => GFProgressBar(
                    percentage: value,
                    circleWidth: 10,
                    progressHeadType: GFProgressHeadType.circular,
                    animateFromLastPercentage: true,
                    radius: 250,
                    type: GFProgressType.circular,
                    backgroundColor: const Color(0xff00082e),
                    progressBarColor: const Color(0xffffbe33),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              // Stroked text as border.
                              Text(
                                "${(value * 2.45).toStringAsFixed(2)}€",
                                style: GoogleFonts.mulish(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ])),
              ),
            ),
            GFListTile(
              avatar: Iconify(
                Iwwa.month,
                color: Color(0xff00082e),
              ),
              titleText: 'October achievement 🎃',
              color: Color(0xFFE0E1E5),
              subTitleText:
                  'Spent on average 0.12€ less compared to people in your area to do a load of laundry',
            ),
            GFListTile(
              avatar: Iconify(
                EmojioneMonotone.popcorn,
                color: Color(0xff00082e),
              ),
              titleText: "Today's cheapest hours 🤑",
              color: Color(0xFFE0E1E5),
              subTitleText:
                  "If you're feeling like Netflix and an oven baked pizza, 16:00 - 18:00 is the time. Be smart with your money and save the planet!",
            ),
          ],
        ),
      ),
    );
  }
}
