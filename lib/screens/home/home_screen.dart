import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/game_icons.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/icon_park_twotone.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:pennypinch/screens/appliances/appliances_screen.dart';
import 'package:pennypinch/screens/forecast/forecast_screen.dart';
import 'package:pennypinch/screens/savings/savings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;
  final screens = [
    AppliancesScreen(),
    const SavingsScreen(),
    ForecastScreen(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            HapticFeedback.selectionClick();
            setState(() => _currentIndex = index);
          },
          backgroundColor: const Color(0xffECEEF2),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.blueGrey,
          showUnselectedLabels: false,
          iconSize: 30,
          items: const [
            BottomNavigationBarItem(
              icon: Iconify(IconParkTwotone.washing_machine_one),
              label: 'Appliances',
            ),
            BottomNavigationBarItem(
              icon: Iconify(Ic.twotone_savings),
              label: 'Savings',
            ),
            BottomNavigationBarItem(
              icon: Iconify(Mdi.chart_timeline_variant_shimmer),
              label: 'Forecast',
            )
          ],
        ),
        body: screens[_currentIndex],
      );
}
