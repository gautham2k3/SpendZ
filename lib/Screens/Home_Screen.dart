import 'package:flutter/material.dart';
import 'Settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int balance = 1000; // Example balance value, replace with your actual balance
  List<String> transactionHistory = [
    'Transaction 1',
    'Transaction 2',
    'Transaction 3',
    'More to come ',
    'More and More',
    'More Transaction',
    'Transaction 1',
    'Transaction 2',
    'Transaction 3',
    'More to come ',
    'More and More',
    'More Transaction',
    'Transaction 1',
    'Transaction 2',
    'Transaction 3',
    'More to come ',
    'More and More',
    'More Transaction',
    // Add your transaction history items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            forceElevated: true,
            leading: IconButton(
              icon: Icon(Icons.settings),
              iconSize: 30,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text("SpendZ"),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.account_circle_rounded),
                iconSize: 30,
                onPressed: () {
                  setState(() {});
                },
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Balance Left: \$${balance.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Transaction History',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: transactionHistory.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(transactionHistory[index]),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
