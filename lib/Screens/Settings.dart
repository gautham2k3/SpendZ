import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget{
  Settings ( {super.key});
  void handelTap()
  {

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
                        leading: Icon(Icons.language),
                        title: Text("Language"),
                        subtitle: Text("English"),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: Icon(Icons.category_rounded),
                        title: Text("Categories"),
                        subtitle: Text("Add or Remove"),
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