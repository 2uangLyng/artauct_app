import 'package:artauct_app/pages/home_page.dart';
import 'package:artauct_app/pages/preorder_page.dart';
import 'package:artauct_app/pages/search_page.dart';
import 'package:artauct_app/pages/sell_page.dart';
import 'package:artauct_app/pages/account_page.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, this.title});
  final String? title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.home,
      "Home",
      Colors.black,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
      ),
    ),
    TabItem(
      Icons.search,
      "Search",
      Colors.black,
      labelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.layers,
      "Sell",
      Colors.black,
    ),
    TabItem(
      Icons.shopping_cart,
      "PreOrder",
      Colors.black,
    ),
    TabItem(
      Icons.account_circle,
      "Account",
      Colors.black,
    ),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
            child: bodyContainer(),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    switch (selectedPos) {
      case 0:
        return const HomePage();
      case 1:
        return const SearchPage();
      case 2:
        return const SellPage();
      case 3:
        return const PreOrderPage();
      case 4:
        return const AccountPage();
      default:
        return const HomePage();
    }
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      // use either barBackgroundColor or barBackgroundGradient to have a gradient on bar background
      barBackgroundColor: Colors.white,

      backgroundBoxShadow: const <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: const Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
