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
                icon: const Icon(Icons.minimize_rounded),
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
        items:  const <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_rounded),
            label: "Home",
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
