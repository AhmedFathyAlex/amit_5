import 'package:amit_5/database_helper.dart';
import 'package:amit_5/task_model.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
   TaskItem({super.key,required this.taskModel});
   TaskModel taskModel;
  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
            title: Text(widget.taskModel.name),
            trailing: Checkbox(
              onChanged: (value) {
              setState(() {
                DatabaseHelper.markTaskAsDone(widget.taskModel.id);
                widget.taskModel.isDone = 1;
              });
            },
            value: widget.taskModel.isDone == 0 ? false : true,),
          );
  }
}