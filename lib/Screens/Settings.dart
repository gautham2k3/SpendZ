import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spendz/Data/Expense_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Settings/Categories.dart';
import 'package:provider/provider.dart';
import 'package:simple_icons/simple_icons.dart';

class Settings extends StatelessWidget{
  Settings ( {super.key});
  int selectedCurrency = 0;
  List<String> currency = [    "None", "Rupee - ₹", "Dollar - \$ ", "Euro - €"  ];
  List<int> cur=[0,1,2,3];
  void handleTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Categories()),
    );
  }
  SimpleDialog CurencyHandler(BuildContext context) {
   return SimpleDialog(
     title: const Text('Select Currency'),
     children: cur.map((r) => RadioListTile(
       title:  Text(currency[r]),
       groupValue: selectedCurrency,
       selected: r == selectedCurrency,
       value: r,
       onChanged: (dynamic val) {
           selectedCurrency = val;
           Provider.of<ExpenseData>(context,listen: false).addSettings(0, r);
           Navigator.of(context).pop();
       },
     )).toList(),
   );
  }
  void showAlertDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Erase All Data'),
        content: const Text('All the existing data will be erased and cannot be further Backed up '),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Provider.of<ExpenseData>(context,listen: false).clearAllExpenses();
              Navigator.pop(context, 'ERASE');
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('All Data Deleted'),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ));
            },
            child: const Text('ERASE',style: TextStyle(color: Colors.red),)
          ),
        ],
      ),
    );
  }
  bool lockAppSwitchVal = true;
  bool fingerprintSwitchVal = false;
  bool changePassSwitchVal = true;

  @override
  Widget build(BuildContext context) {
    final toLaunch = Uri.parse('https://github.com/gautham2k3/SpendZ');
    return Consumer<ExpenseData>(
        builder: (context,value,child)
    {
      selectedCurrency = Provider.of<ExpenseData>(context, listen: false).getSavedSettings(1);
      print(selectedCurrency);
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.navigate_before_rounded),
                iconSize: 30,
                onPressed: () {
                  Navigator.pop(context);
                }
            ),
            title: const Text('Settings'),
            centerTitle: true,
          ),
          body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("Common",
                            ),
                          ],
                        ),
                        ListTile(
                          leading: const Icon(Icons.currency_exchange),
                          title: const Text("Currency"),
                          subtitle: Text(currency[selectedCurrency]),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CurencyHandler(context);
                              },
                            );
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.category_rounded),
                          title: const Text("Categories"),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          subtitle: const Text("Add or Remove"),
                          onTap: () => handleTap(context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("Security"),
                          ],
                        ),
                        ListTile(
                          leading: const Icon(Icons.fingerprint),
                          title: const Text("Use fingerprint"),
                          trailing: Switch(
                              value: fingerprintSwitchVal,
                              activeColor: Colors.blueAccent,
                              onChanged: (val) {}),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.lock),
                          title: const Text("Change Password"),
                          trailing: Switch(
                              value: changePassSwitchVal,
                              activeColor: Colors.blueAccent,
                              onChanged: (val) {}),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("Data"),
                          ],
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.phonelink_erase_rounded, color: Colors.red,),
                          title: const Text(
                              "Erase all Data", selectionColor: Colors.red),
                          onTap: () => showAlertDialog(context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("Social"),
                          ],
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(
                              SimpleIcons.github, color: Colors.black),
                          title: const Text("GitHub"),
                          subtitle: const Text('Star & Share the Repo'),
                          trailing: IconButton(
                            icon: const Icon(Icons.open_in_new),
                            tooltip: 'Open Link in Browser',
                            onPressed: () {
                              launchUrl(
                                toLaunch,
                                mode: LaunchMode.externalApplication,
                              );
                            },
                          ),
                        ),
                        const Divider(),
                      ],
                    ),

                  ),
                )
              ])

      );
    },
    );
  }

}