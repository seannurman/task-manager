import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

import 'tasks_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final task = taskData.tasks[index];
          return GestureDetector(
            onLongPress: () {
              taskData.removeTask(task);
              print('test');
            },
            child: TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(task);
                }),
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
