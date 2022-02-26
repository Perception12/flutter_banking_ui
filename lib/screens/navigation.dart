import 'package:flutter/material.dart';
import 'package:flutter_banking_ui/screens/statistics_page.dart';
import '../../colors.dart' as color;

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = [
    Center(
      child: Icon(Icons.home),
    ),
    StatisticsPage(),
    Center(
      child: Icon(Icons.credit_card_rounded),
    ),
    Center(
      child: Icon(Icons.person),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: color.AppColor.mainBackground,
        selectedItemColor: color.AppColor.primaryColor,
        unselectedItemColor: color.AppColor.greyColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
            ),
            label: 'statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.credit_card_rounded,
            ),
            label: 'card',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
