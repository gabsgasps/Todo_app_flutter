import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_gabs/models/task_data.dart';

import 'tasks_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TasksTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              remove: () => taskData.deleteTask(task),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
