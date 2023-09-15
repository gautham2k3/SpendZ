import 'package:flutter/cupertino.dart';
import '../Model/Expense_item.dart';


class ExpenseData extends ChangeNotifier {
  List<ExpenseItem> overallExpenseList = [];

  List<ExpenseItem> getExpenseList() {
    return overallExpenseList;
  }

  void addExpense(ExpenseItem newExpense)
  {
    overallExpenseList.add(newExpense);
    notifyListeners();
  }

  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);
  }

}

