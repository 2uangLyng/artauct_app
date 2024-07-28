import 'package:artauct_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController =
        CircularBottomNavigationController(0); // Initial selected position
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(
          _navigationController.value!), // Use _navigationController.value
      bottomNavigationBar: CircularBottomNavigation(
        tabItems,
        controller: _navigationController,
        selectedCallback: (int? selectedPos) {
          setState(() {
            _navigationController.value =
                selectedPos; // Update _navigationController.value
          });
        },
        barHeight: 60,
        circleStrokeWidth: 2,
        iconsSize: 24,
        barBackgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 300),
        selectedIconColor: Colors.black,
      ),
    );
  }

  Widget _getBody(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const HomePage();
      case 1:
        return Container(color: Colors.orange);
      case 2:
        return Container(color: Colors.red);
      case 3:
        return Container(color: Colors.cyan);
      case 4:
        return Container(color: Colors.green);
      default:
        return Container(color: Colors.white);
    }
  }

  List<TabItem> get tabItems => [
        TabItem(Icons.home, "Home", Colors.blue,
            labelStyle: const TextStyle(fontWeight: FontWeight.normal)),
        TabItem(Icons.search, "Search", Colors.orange,
            labelStyle: const TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold)),
        TabItem(Icons.layers, "Reports", Colors.red,
            circleStrokeColor: Colors.black),
        TabItem(Icons.notifications, "Notifications", Colors.cyan),
        TabItem(Icons.person, "Profile", Colors.green),
      ];
}
