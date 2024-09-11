import 'package:flutter/material.dart';
import 'package:sqllite/addStudent.dart';
import 'package:sqllite/dbutils.dart';
import 'package:sqllite/sstudent_model.dart';

void main() {
  runApp(
    MaterialApp(home: MainApp() ,)
   );
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Student> currentList = [];
  @override
  void initState() {
    
  }
  @override
  Widget build(BuildContext context) {
           
    return  Scaffold(
        appBar: AppBar(title: Center(child: Text('Student Details'),),backgroundColor: Colors.blue,),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>AddStudent() ));
        },child:Icon(Icons.add) ,),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              
               ElevatedButton(onPressed: () async{
                DBUtils dbUtils = await DBUtils.getsingletonclass();
                List<Student> l = await dbUtils.getRecod(low: false);
                setState(() {
                  currentList=l;
                });
          
              }, child: Text("Lowest Mark")),
              ElevatedButton( onPressed: () async{
                DBUtils dbUtils = await DBUtils.getsingletonclass();
                List<Student> l = await dbUtils.getRecod();
                setState(() {
                  currentList=l;
                });}, child:  Text("Highest Mark")),
             ],),
                currentList.length > 0
          ? Expanded(
              child: ListView.builder(
                  itemCount: currentList.length,
                  itemBuilder: (context, index) {
                    final Student = currentList[index];
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Card(
                        color: Colors.blue[100],
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(' Name  ${Student.name}\n Marks  ${Student.mark} \n City      ${Student.city}',
                          style: TextStyle(fontSize: 16),
                                                ),
                        ),)
                    );
                  }))
          : Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Card(child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text("Press Any button to show data"),
            )),
          )
            ],
          ),
        ),
      );
  }
}
     




 
