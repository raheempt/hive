import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive2/Todu.dart';


class AddTodo extends StatelessWidget {
  TextEditingController titilController =TextEditingController();
  Box TodoBox = Hive.box<Todo>('todo');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            TextField(
            controller: titilController,
            decoration: InputDecoration(
              labelText: 'name',
              border: OutlineInputBorder()
            ),
            ),
            SizedBox(height: 30,),
            Container(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                if(titilController.text !=''){
                  Todo newTodu = Todo(
                    title: titilController.text,
                     isCompleted: false);
                     TodoBox.add(newTodu);
                     Navigator.pop(context);
                }
              },
               child: Text('Add Todu',style: TextStyle(fontSize: 20 ),
               )),
            )

        ],
      ),
      ),
      
    );
  }
}