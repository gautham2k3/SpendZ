import 'package:flutter/material.dart';
import '../Data/Expense_data.dart';
import 'Settings.dart';
import 'package:provider/provider.dart';
import 'package:spendz/utils.dart';



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
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
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
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //         (BuildContext context, int index) {
            //       return Container();
            //     },
            //     childCount: 10,
            //   ),
            // ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    // group73E9 (274:230)
                    margin: EdgeInsets.fromLTRB(16*fem, 10*fem, 16*fem, 16*fem),
                    // padding: EdgeInsets.fromLTRB(16*fem, 24*fem, 16*fem, 23*fem),
                    width: double.infinity,
                    height: 110*fem,
                    decoration: BoxDecoration (
                      color: Color(0xfff2f2f7),
                      borderRadius: BorderRadius.circular(13*fem),
                    ),
                    child: Stack(
                      children: [
                        // Positioned(
                        //   // rectangle3n3j (203:17)
                        //   left: 120*fem,
                        //   top: 42*fem,
                        //   child: ImageFiltered(
                        //     imageFilter: ImageFilter.blur (
                        //       sigmaX: 40*fem,
                        //       sigmaY: 40*fem,
                        //     ),
                        //     child: Align(
                        //       child: SizedBox(
                        //         width: 343*fem,
                        //         height: 110*fem,
                        //         child: Container(
                        //           decoration: BoxDecoration (
                        //             borderRadius: BorderRadius.circular(24*fem),
                        //             color: const Color(0x4c007aff),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Positioned(
                          // rectangle2erd (198:15)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 343*fem,
                              height: 110*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(24*fem),
                                  color:const Color(0x99007aff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // Aa5 (198:16)
                          left: 16*fem,
                          top: 45*fem,
                          child: Align(
                            child: SizedBox(
                              width: 140*fem,
                              height: 42*fem,
                              child: Text(
                                '₹$balance',
                                style: SafeGoogleFont (
                                  'Inter',
                                  fontSize: 34*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2125*ffem/fem,
                                  letterSpacing: -0.3700000048*fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // mybalanceTZB (198:17)
                          left: 16*fem,
                          top: 24*fem,
                          child: Align(
                            child: SizedBox(
                              width: 83*fem,
                              height: 20*fem,
                              child: Text(
                                'My Balance',
                                style: SafeGoogleFont (
                                  'Inter',
                                  fontSize: 15*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3333333333*ffem/fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // xkq (198:18)
                          left: 305*fem,
                          top: 38*fem,
                          child: Align(
                            child: SizedBox(
                              width: 11*fem,
                              height: 18*fem,
                              child: Center(
                                child: Center(
                                  child: Icon(
                                    Icons.navigate_next_rounded, // Replace 'Icons.star' with the Material Icon you want
                                    size: 35 * fem,
                                    color: Colors.white, // You can specify the color you want
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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





