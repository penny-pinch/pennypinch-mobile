import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pennypinch/services/firestore_services.dart';
import 'package:pennypinch/shared/loader.dart';

class ForecastScreen extends StatelessWidget {
  ForecastScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>?>(
        future: FirestoreService().getTomorrowsPrice(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('$snapshot.error'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          } else if (snapshot.hasData) {
            var forecast = snapshot.data!;
            if (forecast.isEmpty) {
              return Center(
                child: Column(children: const [
                  SizedBox(
                    height: 240,
                  ),
                  Icon(Icons.folder_off_outlined),
                  Text("No forecasts")
                ]),
              );
            }
            print(forecast);
            return Container(
              height: 800,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                top: 80,
              ),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Hourly prices today",
                      style: GoogleFonts.mulish(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Container(
                      height: 600,
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: forecast['prices']
                            .map<Widget>(
                              (price) => TweenAnimationBuilder<double>(
                                tween: Tween<double>(
                                    begin: 0.0, end: price['price'] * 4),
                                duration: const Duration(milliseconds: 750),
                                builder: (context, value, _) => GFProgressBar(
                                  percentage: value,
                                  type: GFProgressType.linear,
                                  lineHeight: 12,
                                  linearGradient: LinearGradient(
                                    colors: [
                                      Color(0xffffbe33),
                                      Color(0xff00082e)
                                    ],
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                  ),
                                  backgroundColor: Color(0xff00082e),
                                  leading: Text(
                                    price['time'],
                                    style: GoogleFonts.mulish(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white),
                                  ),
                                  child: Text(
                                    price['price'].toStringAsFixed(4) + "€",
                                    textAlign: TextAlign.end,
                                    style: GoogleFonts.mulish(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
