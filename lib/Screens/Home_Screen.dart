import 'package:flutter/material.dart';
import 'Settings.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();

  }
}


class _HomeScreenState extends State<HomeScreen> {

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
                iconSize:30 ,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                }
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("BUDGET"),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.account_circle_rounded),
                iconSize: 30,
                onPressed:() {
                  setState((){});
                },
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context,int index) {
                return Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 100,
                  color: Colors.blue[100],
                  child: Text(
                    "Value of x : ",style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}