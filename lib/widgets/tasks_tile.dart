import 'package:flutter/material.dart';

class TasksTile extends StatefulWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;
  final Function remove;

  TasksTile(
      {this.isChecked = false,
      this.taskTitle,
      this.checkboxCallback,
      this.longPressCallback,
      this.remove});

  @override
  _TasksTileState createState() => _TasksTileState();
}

class _TasksTileState extends State<TasksTile> {
  var toExclude = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListTile(
          onLongPress: () {
            setState(() {
              toExclude = !toExclude;
            });
          },
          title: Text(
            widget.taskTitle,
            style: TextStyle(
                decoration:
                    widget.isChecked ? TextDecoration.lineThrough : null),
          ),
          trailing: !toExclude
              ? Checkbox(
                  value: widget.isChecked,
                  activeColor: Colors.lightBlueAccent,
                  onChanged: (newValue) => widget.checkboxCallback(newValue))
              : IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: widget.remove,
                )),
    );
  }
}
