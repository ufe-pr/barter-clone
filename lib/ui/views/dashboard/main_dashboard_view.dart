import 'package:barter/ui/widgets.dart';
import 'package:flutter/material.dart';

import 'cards/dashboard_cards_view.dart';
import 'home/dashboard_home_view.dart';

class MainDashboardView extends StatefulWidget {
  final int? index;

  const MainDashboardView({Key? key, this.index}) : super(key: key);
  @override
  _MainDashboardViewState createState() => _MainDashboardViewState();
}

class _MainDashboardViewState extends State<MainDashboardView> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.index ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const iconColor = Colors.blueGrey;
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex % 2,
        children: [
          DashboardHomeView(),
          DashboardCardsView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: AssetIcon(icon: "home", color: iconColor),
            activeIcon: AssetIcon(icon: "home"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: AssetIcon(icon: "cards", color: iconColor),
            activeIcon: AssetIcon(icon: "cards"),
            label: "Cards",
          ),
          BottomNavigationBarItem(
            icon: AssetIcon(icon: "transactions", color: iconColor),
            activeIcon: AssetIcon(icon: "transactions"),
            label: "Transaction",
          ),
          BottomNavigationBarItem(
            icon: AssetIcon(icon: "settings", color: iconColor),
            activeIcon: AssetIcon(icon: "settings"),
            label: "More",
          ),
        ],
      ),
    );
  }
}
