import 'package:flutter/material.dart';
import '../API/Number_Fact.dart';
import '../Design/FrostedGlass.dart';
class BalanceOverview extends StatefulWidget {
  final int number;
  BalanceOverview({required this.number});
  @override
  _BalanceOverviewState createState() => _BalanceOverviewState();
}

class _BalanceOverviewState extends State<BalanceOverview> {
  String fact = 'Loading';
  String? balanceO;
  @override
  void initState() {
    super.initState();
    balanceO = widget.number.toString();
    fetchNumberFact('trivia', widget.number.toString()).then((value) {
      setState(() {
        fact = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.navigate_before_rounded),
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Balance Overview'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Balance_Overview_Background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: FrostedGlassBox(
                theWidth: 330.0,
                theHeight: 50.0,
                theChild: Text(
                  'Balance Left : $balanceO',
                  style: const TextStyle(color: Colors.white70, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: FrostedGlassBox(
                theWidth: 330.0,
                theHeight: 100.0,
                theChild: Text(
                  fact,
                  style: const TextStyle(color: Colors.white70, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Add more FrostedGlassBox widgets as needed
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        focusColor: Colors.white54,
        onPressed: () {fetchNumberFact('trivia', widget.number.toString()).then((value) {
          setState(() {
            fact = value;
          });
        });
        },
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 3, color: Colors.white54),
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
