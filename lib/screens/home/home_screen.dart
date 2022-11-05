import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pennypinch/screens/appliances/appliances_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;
  final screens = [
    AppliancesScreen(),
    const Text("Finances"),
    const Text("Settings"),
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
              icon: Icon(Icons.home),
              label: 'Appliances',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.currency_exchange),
              label: 'Finances',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            )
          ],
        ),
        body: screens[_currentIndex],
      );
}
