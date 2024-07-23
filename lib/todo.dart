import 'package:amit_5/database_helper.dart';
import 'package:amit_5/task_item.dart';
import 'package:amit_5/task_model.dart';
import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
   Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}


class _TodoState extends State<Todo> {
  // properties
  List<Widget> tasks = [];
  TextEditingController taskController = TextEditingController();

  //function
  @override
  void initState(){
    super.initState();
   
    getTasks();
  }

  getTasks()async{
      await DatabaseHelper.initDb();
    var tasksMap = await DatabaseHelper.readTasksFromDB();
    tasks.clear();
    for (var task in tasksMap) {
      TaskModel model = TaskModel.fromJson(task);
      setState(() {
         tasks.add(TaskItem(taskModel: model));
      });
     
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context, builder:(context) {
          return  Container(
            width: double.infinity,
            child: Column(
              children: [
                TextField(controller: taskController,), 
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  setState(() {
                  DatabaseHelper.insertTask(taskController.text);
                  getTasks();
                  taskController.clear();
                  Navigator.pop(context); 
                  });
                  
                }, child: const Text('Save'))
              ],
            ),
          );
        },
        );
      },child: Icon(Icons.add),),
      appBar: AppBar(title: Text('Todo App'),),
      body: ListView.builder(
        itemBuilder:(context, index) {
        return tasks[index];
      },
      itemCount: tasks.length,
      ),
    );
  }
}