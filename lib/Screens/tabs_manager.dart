import 'package:flutter/material.dart';
import 'Home_Screen.dart';
import 'Login_Page.dart';
import 'addTransactionPage.dart';

class tabs_manager extends StatefulWidget {
  const tabs_manager({super.key});
  @override
  State<tabs_manager> createState() => _tabs_manager();
}

class _tabs_manager extends State<tabs_manager> {
  int currentPageIndex = 0;
  var _selectedIndex = 0;
  List<Widget> _screens = [
    HomeScreen(),
    LoginScreen(),
  ];

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      body: _screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open the Add Transaction dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddTransactionPage();
            },
          );
        },
        tooltip: "Create",
        elevation: 0.0,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        selectedIconTheme: const IconThemeData(
            color: Colors.blueAccent, size: 30),

        showSelectedLabels: true,
        selectedFontSize: 13,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_rounded, size: 25),
            label: "Home",
            tooltip: "Home Screen",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_rounded, size: 25),
            label: "Account",
            tooltip: "Account Section",
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onTappedItem,
      ),

    ));
  }
}
