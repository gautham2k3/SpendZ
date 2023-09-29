import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spendz/Data/Expense_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Categories.dart';
import 'package:provider/provider.dart';
import 'package:simple_icons/simple_icons.dart';


class Settings extends StatelessWidget{
  Settings ( {super.key});
  void handleTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Categories()),
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon:const Icon(Icons.navigate_before_rounded),
            iconSize: 30,
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        title:const Text('Settings'),
        centerTitle: true,
      ),
        body :CustomScrollView(
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
                      const ListTile(
                        leading: Icon(Icons.currency_rupee_rounded),
                        title: Text("Currency"),
                        subtitle: Text("Indian Rupee"),
                      ),
                      const Divider(),
                       ListTile(
                        leading: const Icon(Icons.category_rounded),
                        title: const Text("Categories"),
                        trailing:const Icon(Icons.keyboard_arrow_right),
                        subtitle:const  Text("Add or Remove"),
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
                            onChanged: (val) { }),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.lock),
                        title: const Text("Change Password"),
                        trailing: Switch(
                            value: changePassSwitchVal,
                            activeColor: Colors.blueAccent,
                            onChanged: (val) {
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text("Data"),
                        ],
                      ),
                       ListTile(
                        leading:const Icon(Icons.phonelink_erase_rounded, color: Colors.red,),
                        title:const Text("Erase all Data",selectionColor: Colors.red),
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
                        leading: const Icon(SimpleIcons.github, color: Colors.black),
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
  }

}