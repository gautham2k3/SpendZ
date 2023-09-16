import 'package:flutter/material.dart';
import '../Data/Expense_data.dart';
import 'Settings.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int balance = 1000; // Example balance value, replace with your actual balance
  @override
  void initState() {
    super.initState();
    Provider.of<ExpenseData>(context,listen: false).prepareData();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context,value,child) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              forceElevated: true,
              leading: IconButton(
                icon: const Icon(Icons.settings),
                iconSize:30 ,
                onPressed: () {
                  // Open the Add Transaction dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Settings();
                    },
                  );
                },
              ),
              flexibleSpace:const FlexibleSpaceBar(
                centerTitle: true,
                title: Text("SpendZ"),
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
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container();
                },
                childCount: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    padding:const EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Balance Left: \$${balance.toStringAsFixed(2)}',
                      style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding:const EdgeInsets.fromLTRB(0,225,0,0),
                    child: const Text(
                      'Transaction History',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.getExpenseList().length,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(value.getExpenseList()[index].name),
                        subtitle: Text(
                            '${value.getExpenseList()[index].dateTime.hour}:'
                                '${value.getExpenseList()[index].dateTime.minute} / '
                                '${value.getExpenseList()[index].dateTime.day}.'
                                '${value.getExpenseList()[index].dateTime.month}.'
                                '${value.getExpenseList()[index].dateTime.year.toString().substring(2)}'
                        ),
                        trailing: Text('₹${value.getExpenseList()[index].amount}',
                          style: const TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}





