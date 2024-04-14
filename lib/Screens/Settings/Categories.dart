import 'package:flutter/material.dart';
import 'package:spendz/Data/hive_database.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});
  @override
  State<Categories> createState() => _Categories();
}
final hive=HiveDataBase();
List<String> avlC=['Education','Food','Travel','Miscellaneous'];
String newCategory='';

void setData(aC) async {
  hive.setCategory(aC);
  //print('List saved to Hive.');
}
void getData() async {
  List<String> aC=hive.getCategory();
  if(aC.isEmpty){
    setData(avlC);
    getData();
  }
  avlC=aC;
}

int value=27;

class _Categories extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios_rounded),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title:const Text("Categories"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
            setData(avlC);
            getData();
            return ChoiceChip(
              label: Text(
              avlC[index],
              style: TextStyle(fontSize: 16.0,
              color: (value==index) ? Colors.white : Colors.black,
              ),),
              selected: value == index,
              onSelected: (bool selected) {
              setState(() {
              value = selected ? index : 27;
              });
              },
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              ),
              elevation: 4.0,
              );
            },
              childCount: avlC.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              Expanded(
                child: ElevatedButton(
                  onPressed:() {
                    setState((){
                      showDialog(context: context, builder: (BuildContext) {
                        return AlertDialog(
                          title: const Text('Enter Category'),
                          content: TextField(
                            decoration: const InputDecoration(hintText: "Enter your input here"),
                            onChanged: (value){
                              newCategory = value; // Update newCategory as user types
                            },
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancel'),

                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('ADD'),
                              onPressed: () {
                                setState(() {
                                  (newCategory.isNotEmpty)?
                                  avlC.add(newCategory)
                                      : null ;
                                  Navigator.of(context).pop();
                                });

                              },
                            ),
                          ],
                        );
                      });
                      setData(avlC);
                      getData();
                    });
                  },
                  child: const Text('ADD CATEGORY'),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                // child: Visibility(
                //   visible: (value!=69),
                child: ElevatedButton(
                  onPressed:(value!=69 && avlC.isNotEmpty)? () {
                    if(avlC.length<=4){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content:  const Text("At least 4 Categories are Required"),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0)
                            ),
                            backgroundColor: Colors.black45,
                          )
                      );
                    } else {
                      setState(() {
                        avlC.remove(avlC[value]);
                        setData(avlC);
                        getData();
                      });
                    }
                  } : null,
                  child: Text(
                    'REMOVE',
                    style: TextStyle(color: (value!=69 && avlC.isNotEmpty) ? Colors.red : null),
                  ),
                ),
              ),
              // ),
            ],
          ),
        ),
      ),
      );
  }
}