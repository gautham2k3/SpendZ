import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spendz/Data/Expense_data.dart';
import 'package:spendz/Model/Expense_item.dart';
import 'package:spendz/utils.dart';
import 'package:spendz/Screens/Settings/Categories.dart';

enum TypeEI {expense,income}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddTransactionPage(),
    );
  }
}

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  Set<TypeEI> selectedAccessories = <TypeEI>{TypeEI.expense};
  TypeEI selectedIndex =TypeEI.expense;
  // Variables to store transaction details
  String? title;
  double? amount;
  String? selectedCategory; // Selected category
  DateTime? dateTime;
  // Create text editing controllers for the input fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  // Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int? _value;
  var avlC=['Education','Food','Travel','Miscellaneous'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      double leftBalance=Provider.of<ExpenseData>(context,listen: false).getBalance()-amount!;
      dateTime=DateTime.now();

      print('Title: $title');
      print('Amount: $amount');
      print('Category: $selectedCategory');
      print('Date & Time: $dateTime');


      ExpenseItem newExpense=ExpenseItem(
          name: title.toString(),
          dateTime: DateTime.now(),
          amount: amount.toString()
      );

      setState(() {
        Provider.of<ExpenseData>(context,listen: false).addExpense(newExpense);
        Provider.of<ExpenseData>(context,listen: false).setBalance(leftBalance);
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0), // Remove padding
            content: Container(
              // decoration: BoxDecoration(
              //   // shape: BoxShape.circle, // Make it circular
              //   color: Colors.white, // Set background color
              // ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 50, // Adjust the size as needed
                    backgroundColor: Colors.blue, // Circle background color
                    child: Icon(
                      Icons.check,
                      size: 60,
                      color: Colors.white,
                    ),
                    // Replace with your image
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Expense Submitted',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  TextButton(
                    child:const Text('OK',
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pop(context);// Close the dialog
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      double leftBalance=Provider.of<ExpenseData>(context,listen: false).getBalance()+amount!;
      dateTime=DateTime.now();
      ExpenseItem newIncome=ExpenseItem(
          name: "Income27",
          dateTime: DateTime.now(),
          amount: amount.toString()
      );
      setState(() {
        Provider.of<ExpenseData>(context,listen: false).addExpense(newIncome);
      });
      Provider.of<ExpenseData>(context,listen: false).setBalance(leftBalance);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0), // Remove padding
            content: Container(
              // decoration: BoxDecoration(
              //   // shape: BoxShape.circle, // Make it circular
              //   color: Colors.white, // Set background color
              // ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Balance Updated',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    child:const Text('OK',
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pop(context);// Close the dialog
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    avlC=hive.getCategory();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SegmentedButton<TypeEI>(
                selected: selectedAccessories,
                onSelectionChanged: (Set<TypeEI> newSelection) {
                  setState(() {
                    selectedAccessories = newSelection;
                    selectedIndex=newSelection.first;
                  });
                },
                emptySelectionAllowed: true,
                showSelectedIcon: false,
                selectedIcon: const Icon(Icons.check_circle),
                segments: const <ButtonSegment<TypeEI>>[
                  ButtonSegment<TypeEI>(
                    value: TypeEI.expense,
                    label: Text('Expense'),
                    icon: Icon(Icons.upload_rounded),
                  ),
                  ButtonSegment<TypeEI>(
                    value: TypeEI.income,
                    label: Text('Income'),
                    icon: Icon(Icons.download),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _titleController,
                decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                  border:const OutlineInputBorder(),
                    filled: true,
                    labelText: selectedIndex==TypeEI.expense ? 'Expense': 'Income',
                ),
                keyboardType: TextInputType.number,
                autofocus: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    amount = double.tryParse(value);
                  });
                },
              ),
              const SizedBox(height: 10),
              // Visibility(
              //   visible: selectedIndex==TypeEI.expense,
              //     maintainState: true,
              //     maintainAnimation: true,
              //     maintainSize: true,
              //     child: DropdownButtonFormField<String>(
              //   decoration:const InputDecoration(
              //     labelText: 'Category',
              //     border: OutlineInputBorder(),
              //     filled: true,
              //   ),
              //   value: selectedCategory,
              //   onChanged: (value) {
              //     setState(() {
              //       selectedCategory = value;
              //     });
              //   },
              //   items: [
              //     'Stationery',
              //     'Food',
              //     'Entertainment',
              //     'Miscellaneous',
              //   ].map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please select a category';
              //     }
              //     return null;
              //   },
              // ),
              // ),
              // const SizedBox(height: 20),
              Wrap(
                children:<Widget>[
                  const SizedBox(height: 10.0),
                  Wrap(
                    spacing: 3.0,
                    children: List<Widget>.generate(
                      avlC.length,
                          (int index) {
                        return ChoiceChip(
                          label: Text(avlC[index]),
                          labelStyle: TextStyle(
                              color: _value==index? Colors.white : Colors.black
                          ),
                          selected: _value == index,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? index : null;
                            });
                          },
                          backgroundColor: Colors.blue.shade50,
                        );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              const SizedBox(height: 40,),
              Center(
                child:
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    side: MaterialStateProperty.all(
                      const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text('Add Transaction',
                    style: SafeGoogleFont (
                      'Encode Sans SC',
                      fontSize: 18,
                    ),
                    textScaleFactor: 1.1,
                    selectionColor: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
