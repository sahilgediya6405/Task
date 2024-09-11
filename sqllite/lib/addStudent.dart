import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqllite/dbutils.dart';



class AddStudent extends StatefulWidget {
  @override
  State<AddStudent> createState() => _MainAppState();
}

class _MainAppState extends State<AddStudent> {
  final TextEditingController nameEdingControler = TextEditingController();
  final TextEditingController cityEdingControler = TextEditingController();
  final TextEditingController markEdingControler = TextEditingController();

  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: Text('Add Student'),
            backgroundColor: Colors.blue,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameEdingControler,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(left: 10),
                    label: Text("Student Name"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: cityEdingControler,
                  decoration: InputDecoration(
                    label: Text("Student City"),
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    keyboardType: TextInputType.number,
                    controller: markEdingControler,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(left: 10),
                      labelText: "Student Mark",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                
                        },
                        child: Text("Back")),
                    ElevatedButton(onPressed: ()async{
                               DBUtils dbUtils = await DBUtils.getsingletonclass();
                               dbUtils.addRecod(context,  nameEdingControler.text, cityEdingControler.text, int.parse(markEdingControler.text));
                    }, child: Text("save"))
                  ],
                ),
              )
            ],
          ));
    
  }
}
