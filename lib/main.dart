import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
int x=0;
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            forceElevated: true,
            leading: IconButton(
                icon: const Icon(Icons.settings),
                iconSize:30 ,
                onPressed: () {}
            ),
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: Text("SpendZ"),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.account_circle_rounded),
                iconSize: 30,
                onPressed:() {
                  setState(()
                  {
                    if(x>0)
                    {
                      x--;
                    }
                  });
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
                  child: const Text(
                    "Stats View",style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  ),
                );
              },
              childCount: 6,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            x++;
          });
        },
        tooltip: "Create",
        elevation: 0.0,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(color: Colors.blueAccent, size: 30),
        backgroundColor: Colors.white54,
        showSelectedLabels: false,
        items:  const <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_rounded),
            label: "Dashboard",
            tooltip: "Home Screen",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_rounded),
            label: "Account",
            tooltip: "Account Section",
          )
        ],
      ),
    );
  }
}
