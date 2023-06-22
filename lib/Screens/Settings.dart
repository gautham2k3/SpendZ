import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Categories.dart';
class Settings extends StatelessWidget{
  Settings ( {super.key});
  void handleTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Categories()),
    );
  }
  bool lockAppSwitchVal = true;
  bool fingerprintSwitchVal = false;
  bool changePassSwitchVal = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body :CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                forceElevated: true,
                leading: IconButton(
                    icon: Icon(Icons.navigate_before_rounded),
                    iconSize:30 ,
                    onPressed: () {
                      Navigator.pop(context);
                    }
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Settings"),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                        leading: const Icon(Icons.phonelink_lock_outlined),
                        title: const Text("Lock app in background"),
                        trailing: Switch(
                            value: lockAppSwitchVal,
                            activeColor: Colors.redAccent,
                            onChanged: (val) {
                            }),

                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.fingerprint),
                        title: const Text("Use fingerprint"),
                        trailing: Switch(
                            value: fingerprintSwitchVal,
                            activeColor: Colors.redAccent,
                            onChanged: (val) { }),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.lock),
                        title: const Text("Change Password"),
                        trailing: Switch(
                            value: changePassSwitchVal,
                            activeColor: Colors.redAccent,
                            onChanged: (val) {
                            }),
                      ),
                    ],
                  ),
                ),
              )
            ])

    );
  }

}