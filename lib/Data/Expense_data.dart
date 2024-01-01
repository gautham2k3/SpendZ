import 'package:flutter/cupertino.dart';
import 'package:spendz/Data/hive_database.dart';
import '../Model/Expense_item.dart';


class ExpenseData extends ChangeNotifier {
  final db=HiveDataBase();

  List<ExpenseItem> overallExpenseList = [];

  List<ExpenseItem> getExpenseList() {
    return overallExpenseList;
  }

  double getBalance(){
    return db.readBalance();
  }

  void setBalance(double balance){
    db.saveBalance(balance);
    notifyListeners();
  }

  void prepareData() {
    if(db.readData().isNotEmpty)
    {
      overallExpenseList=db.readData();
    }
  }
  void addExpense(ExpenseItem newExpense)
  {
    overallExpenseList.add(newExpense);
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  void addIncome(ExpenseItem newIncome) {
    overallExpenseList.add(newIncome);
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);
    db.saveData(overallExpenseList);
  }

  void clearAllExpenses() {
    overallExpenseList.clear();
    notifyListeners();
    db.saveData(overallExpenseList);
  }

}

