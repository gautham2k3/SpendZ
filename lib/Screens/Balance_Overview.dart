import 'package:flutter/material.dart';

class BalanceOverview extends StatefulWidget {
  final int number;
  BalanceOverview({required this.number});
  @override
  _BalanceOverviewState createState() => _BalanceOverviewState();
}

class _BalanceOverviewState extends State<BalanceOverview> {
  String fact = 'Loading';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon:const Icon(Icons.navigate_before_rounded),
            iconSize: 30,
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        title:const Text('Balance Overview'),
      ),
    );
  }
}