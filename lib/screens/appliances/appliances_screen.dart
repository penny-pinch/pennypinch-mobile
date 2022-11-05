import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pennypinch/screens/appliances/appliance_card.dart';
import 'package:pennypinch/services/firestore_services.dart';
import 'package:pennypinch/shared/loader.dart';

class AppliancesScreen extends StatefulWidget {
  AppliancesScreen({super.key});

  @override
  State<AppliancesScreen> createState() => _AppliancesScreenState();
}

class _AppliancesScreenState extends State<AppliancesScreen> {
  bool showalert = false;

  void showAlert() {
    setState(() {
      showalert = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GFFloatingWidget(
        verticalPosition: 250,
        showBlurness: showalert,
        body: FutureBuilder<List>(
          future: FirestoreService().getAppliances(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('$snapshot.error'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loading();
            } else if (snapshot.hasData) {
              var appliances = snapshot.data!;
              if (appliances.isEmpty) {
                return Center(
                  child: Column(children: const [
                    SizedBox(
                      height: 240,
                    ),
                    Icon(Icons.folder_off_outlined),
                    Text("No appliances")
                  ]),
                );
              }

              return Container(
                margin: const EdgeInsets.only(
                  top: 2,
                ),
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  children: appliances
                      .map<Widget>((appliance) => ApplianceCard(
                          appliance: appliance, showAlert: showAlert))
                      .toList(),
                ),
              );
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
        child: showalert == true
            ? GFAlert(
                alignment: Alignment.center,
                type: GFAlertType.rounded,
                title: 'Estimated cost',
                bottombar: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.0, end: 3.4),
                      duration: const Duration(milliseconds: 750),
                      builder: (context, value, _) => GFRating(
                        value: value,
                        size: 25.0,
                        color: Color(0xffffbe33),
                        borderColor: Color(0xffffbe33),
                        onChanged: (value) {},
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    GFBadge(
                      child: SizedBox(
                        child: Text(
                          "Estimated cost: 0.17€/h",
                          style: GoogleFonts.mulish(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff00082e)),
                        ),
                      ),
                      color: Colors.transparent,
                      size: 60,
                      shape: GFBadgeShape.pills,
                      border: BorderSide.none,
                    ),
                    GFBadge(
                      child: SizedBox(
                        child: Text(
                          "Savings compared to peak hours: 0.10€/h",
                          style: GoogleFonts.mulish(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff00082e)),
                        ),
                      ),
                      color: Colors.transparent,
                      size: 60,
                      shape: GFBadgeShape.pills,
                      border: BorderSide.none,
                    ),
                    GFBadge(
                      child: SizedBox(
                        child: Text(
                          "Savings compared to daily average: 0.03€/h",
                          style: GoogleFonts.mulish(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff00082e)),
                        ),
                      ),
                      color: Colors.transparent,
                      size: 60,
                      shape: GFBadgeShape.pills,
                      border: BorderSide.none,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GFButton(
                          onPressed: () {
                            setState(() {
                              showalert = false;
                            });
                          },
                          color: Color(0xff00082e),
                          shape: GFButtonShape.pills,
                          type: GFButtonType.outline,
                          text: "Go ahead",
                          textStyle: GoogleFonts.mulish(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff00082e)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GFButton(
                          onPressed: () {
                            setState(() {
                              showalert = false;
                            });
                          },
                          icon: const Icon(
                            Icons.snooze,
                            color: Color(0xffffbe33),
                          ),
                          color: Color(0xff00082e),
                          shape: GFButtonShape.pills,
                          type: GFButtonType.outline,
                          text: "Try later",
                          textStyle: GoogleFonts.mulish(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff00082e)),
                          textColor: Color(0xff00082e),
                        ),
                      ],
                    ),
                  ],
                ))
            : const SizedBox.shrink(),
      ),
    );
  }
}
