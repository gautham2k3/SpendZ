import 'package:flutter/material.dart';
import 'tabs_manager.dart';
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
                  Navigator.of(context).pushReplacement(
                      new MaterialPageRoute(builder: (context) => new tabs_manager())
                  );
                }
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("BUDGET"),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.minimize_rounded),
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