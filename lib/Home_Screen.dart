  
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive2/Add_Todu.dart';
import 'package:hive2/Todu.dart';
import 'package:hive2/edit.dart';
import 'package:hive2/update.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box todoBox = Hive.box<Todo>('todo');

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Hive Todu'),
          ),
          body:ValueListenableBuilder(
            valueListenable: todoBox.listenable(), 
            builder: (context,Box box,Widget){
              if(box.isEmpty){
                return Center(
                  child: Text('new todo'),
                );
              }else{
                return ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: box.length ,
                  itemBuilder: (context,intex){
                  Todo todo =box.getAt(intex);
                  return ListTile(

                    title: Text(todo.title,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:todo.isCompleted? Colors.green : Colors.black,
                      decoration: todo.isCompleted? TextDecoration.lineThrough:TextDecoration.none
                       
                    ),
                    
                
                    ),
                    // leading: Checkbox(value: todo.isCompleted,onChanged: (value){
                    // Todo  newtodo =  Todo(
                    //   title: todo.title,
                    //   isCompleted: value!,
                    // );
                    // box.putAt(  intex,newtodo);
                    // }),
                    // leading: IconButton(icon: Icon(Icons.edit), onPressed: () { 
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>edit()));
                    //  },),
                    leading: IconButton(icon: Icon(Icons.edit),onPressed: () {
                      box.put(Title, intex);
                    },),
                    trailing:IconButton(
                        icon:Icon(Icons.delete,color: Colors.red,),
                        onPressed: (){
                          box.deleteAt(intex);
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(context:Text('todo deletad successfully'),));
                        },
                        
                         ),    
                         
                            
                     
                    );
                  });
              }
            }), 
          
         floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTodo()));
          },
         ),
    );
  }
}