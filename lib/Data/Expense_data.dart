
import 'package:flutter/cupertino.dart';
import 'package:spendz/Data/hive_database.dart';
import '../Model/Expense_item.dart';


class ExpenseData extends ChangeNotifier {
  final db=HiveDataBase();

  List<ExpenseItem> overallExpenseList = [];
  List<int> savedSettings = [0,0,0,0];

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
  int getSavedSettings(int settingNum) {
    savedSettings[0]=db.getSettings();
    print(db.getSettings());
    return savedSettings[0];
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
    setBalance(0);
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  void addSettings(int settingNum,int newSetting) {
    savedSettings[settingNum]=newSetting;
    db.saveSettings(savedSettings);
    print(savedSettings);
    notifyListeners();
  }

  void clearAllExpenses() {
    overallExpenseList.clear();
    notifyListeners();
    db.saveData(overallExpenseList);
  }

}

