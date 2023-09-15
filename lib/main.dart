import 'package:flutter/material.dart';
import 'Data/Expense_data.dart';
import 'Screens/tabs_manager.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ExpenseData(),
      builder: (context,child) =>  MaterialApp(
        title: 'Testing App',
        home: const tabs_manager(),
        debugShowCheckedModeBanner: false,
        //darkTheme: ThemeData.dark().copyWith(useMaterial3: true),
        theme: ThemeData().copyWith(useMaterial3: false),
      ),
    );
  }
}