import 'package:flutter/material.dart';
import 'package:flutter_task_listing_application/widgets/task_card.dart';
import 'package:flutter_task_listing_application/scenes/add_task_screen.dart';

class ListTask extends StatefulWidget {
  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  final List<TaskData> _taskList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Task Board",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.7),
        backgroundColor: Colors.white,
      ),
      body: _taskList.isEmpty
          ? const Center(
        child: Text(
          "No tasks yet.",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : ListView.builder(
        itemCount: _taskList.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskCard(
            taskName: _taskList[index].taskName,
            details: _taskList[index].details,
            dateTime: _taskList[index].dateTime,
            taskNumber: index + 1,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );

          if (newTask != null && newTask is TaskData) {
            setState(() {
              _taskList.add(newTask);
            });
          }
        },
        backgroundColor: Colors.black87,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
