import 'package:flutter/material.dart';
import 'package:spendz/Screens/Balance_Overview.dart';
import '../Data/Expense_data.dart';
import 'Settings.dart';
import 'package:provider/provider.dart';
import 'package:spendz/utils.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  double balance = 0;
  @override
  void initState() {
    super.initState();
    Provider.of<ExpenseData>(context,listen: false).prepareData();
    refreshB();
  }
  void refreshB()
  {
    setState(() {
      balance=Provider.of<ExpenseData>(context, listen: false).getBalance();
    });
  }
  IconData getCategoryIcon(String name) {
    String lowercaseName = name.toLowerCase();
    if (lowercaseName.contains('food') ||
        lowercaseName.contains('juice') ||
        lowercaseName.contains('grocery')) {
      return Icons.fastfood; // Use the food icon
    } else if (lowercaseName.contains('education') ||
        lowercaseName.contains('school') ||
        lowercaseName.contains('college') ||
        lowercaseName.contains('xerox') ||
        lowercaseName.contains('pen')) {
      return Icons.school_outlined; // Use the education icon
    }
    else if (lowercaseName.contains('netflix') ||
        lowercaseName.contains('spotify') ||
        lowercaseName.contains('prime') ||
        lowercaseName.contains('hotstar') ||
        lowercaseName.contains('ott')) {
      return Icons.subscriptions_rounded; // Use the education icon
    }
    else {
      return Icons.category_outlined; // Use a default icon for other categories
    }
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Consumer<ExpenseData>(
      builder: (context,value,child) {
        balance = Provider.of<ExpenseData>(context, listen: false).getBalance();
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                forceElevated: true,
                leading: IconButton(
                  icon: const Icon(Icons.settings),
                  iconSize: 30,
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
                flexibleSpace: const FlexibleSpaceBar(
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
                      margin: EdgeInsets.fromLTRB(
                          16 * fem, 10 * fem, 16 * fem, 16 * fem),
                      // padding: EdgeInsets.fromLTRB(16*fem, 24*fem, 16*fem, 23*fem),
                      width: double.infinity,
                      height: 110 * fem,
                      decoration: BoxDecoration(
                        color: const Color(0xfff2f2f7),
                        borderRadius: BorderRadius.circular(13 * fem),
                      ),
                      child: Stack(
                        children: [
                          // Positioned(
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
                            left: 0 * fem,
                            top: 0 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 343 * fem,
                                height: 110 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        12 * fem),
                                    color: const Color(0x99007aff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16 * fem,
                            top: 45 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 140 * fem,
                                height: 42 * fem,
                                child: Text(
                                  '$balance',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 34 * ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2125 * ffem / fem,
                                    letterSpacing: -0.3700000048 * fem,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16 * fem,
                            top: 24 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 83 * fem,
                                height: 20 * fem,
                                child: Text(
                                  'My Balance',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3333333333 * ffem / fem,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 300 * fem,
                            top: 30 * fem,
                            child: GestureDetector(
                              onTap: () {
                                // refreshB();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      BalanceOverview(number: balance.toInt())),
                                );
                              },
                              child: Align(
                                child: SizedBox(
                                  width: 40 * fem,
                                  height: 50 * fem,
                                  child: Center(
                                    child: Center(
                                      child: Icon(
                                        Icons.navigate_next_rounded,
                                        // Replace 'Icons.star' with the Material Icon you want
                                        size: 35 * fem,
                                        color: Colors
                                            .white, // You can specify the color you want
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    Text(
                      'Transaction History',
                      style: SafeGoogleFont(
                        'Play',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height:300,
                      child: ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: value
                          .getExpenseList()
                          .length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        IconData categoryIcon = getCategoryIcon(value
                            .getExpenseList()[index].name);
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Icon(
                              categoryIcon,
                              size: 30 * fem,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(value.getExpenseList()[index].name),
                          subtitle: Text(
                              '${value.getExpenseList()[index].dateTime.hour}:'
                                  '${value.getExpenseList()[index].dateTime
                                  .minute} / '
                                  '${value.getExpenseList()[index].dateTime
                                  .day}.'
                                  '${value.getExpenseList()[index].dateTime
                                  .month}.'
                                  '${value.getExpenseList()[index].dateTime.year
                                  .toString().substring(2)}'
                          ),
                          trailing: Text(
                            '₹${value.getExpenseList()[index].amount}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold
                            ),
                          ),
                        );
                      },
                    ),
          ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}





