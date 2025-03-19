import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanremo_travel/pages/events_page.dart';
import 'package:sanremo_travel/pages/location_page.dart';
import 'package:sanremo_travel/pages/maps_page.dart';
import 'package:sanremo_travel/pages/setting_page.dart';
import 'package:sanremo_travel/pages/utils/colors.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  final List<Widget> _views = [
    LocationPage(),
    EventsPage(),
    MapsPage(),
    SettingPage(),
  ];

  final List<String> _imagePaths = [
    "images/sada.png",
    "images/mdi_events.png",
    "images/sada.png",
    "images/Vector.png",
  ];

  final List<String> _tabLabels = [
    "Best places",
    "Events",
    "My route",
    "Settings",
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kDarkBlack,
      body: _views[_currentIndex],

      bottomNavigationBar: Container(
        height: height * 0.12,
        color: kDarkBlack, // Fundalul corect
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Evită animația implicită
          backgroundColor: kDarkBlack,
          elevation: 0, // Elimină efectul de umbră
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: kWhite,
          unselectedItemColor: kGRray,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedIconTheme: const IconThemeData(size: 28),
          unselectedIconTheme: const IconThemeData(size: 24),

          items: List.generate(
            _imagePaths.length,
            (index) => BottomNavigationBarItem(
              icon: Image.asset(_imagePaths[index], width: 28, height: 28),
              label: _tabLabels[index],
            ),
          ),
        ),
      ),
    );
  }
}
