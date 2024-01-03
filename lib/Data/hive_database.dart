import 'package:hive_flutter/hive_flutter.dart';
import '../Model/Expense_item.dart';

class HiveDataBase {
  final _myBox = Hive.box("expense_database");

  void saveData(List<ExpenseItem> allExpense) {

    List<List<dynamic>> allExpensesFormatted = [];

    for(var expense in allExpense) {
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime,
      ];
      allExpensesFormatted.add(expenseFormatted);
    }
    //storing the hive box
    _myBox.put("All Expenses", allExpensesFormatted);
  }
  void saveBalance(double balance) {
    _myBox.put("Balance", balance);
  }
  void saveSettings(List<int> newSettings) {
    _myBox.put("Settings",newSettings);
  }
  double readBalance() {
    return _myBox.get("Balance") ?? 0.0; // Default to 0.0 if no balance is stored.
  }

  List<ExpenseItem> readData() {
    List savedExpenses = _myBox.get("All Expenses")?? [] ;
    List<ExpenseItem> allExpenses = [];
    for(int i=0;i<savedExpenses.length;i++) {
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime= savedExpenses[i][2];

      ExpenseItem expense=ExpenseItem(name: name, dateTime: dateTime, amount: amount);
      allExpenses.add(expense);
    }
    return allExpenses;
  }
}