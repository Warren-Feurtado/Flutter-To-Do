import 'package:flutter/material.dart';
import '../components/list_tile.dart';
import '../components/add_task_dialog.dart';

class ToDoHome extends StatefulWidget {
  const ToDoHome({super.key});

  @override
  State<ToDoHome> createState() => _ToDoHomeState();
}

class _ToDoHomeState extends State<ToDoHome> {
  final _addTaskCtrlr = TextEditingController();

  List toDoList = [
    ["Install Flutter", false],
    ["Create Mobile App", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveTask() {
    setState(() {
      toDoList.add([_addTaskCtrlr.text, false]);
      Navigator.pop(context);
      _addTaskCtrlr.clear();
    });
  }

  void addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AddTask(
              controller: _addTaskCtrlr,
              onSave: saveTask,
              onCancel: () => {
                Navigator.pop(context),
                _addTaskCtrlr.clear()
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 141, 222, 196),
      appBar: AppBar(
        title: Center(child: Text('My To-Do List')),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoListTile(
              taskName: toDoList[index][0],
              taskDone: toDoList[index][1],
              onChanged: (val) => checkBoxChanged(val, index));
        },
        // body: ListView(
        //   children: [
        //     ToDoListTile(
        //       taskName: "install flutter",
        //       taskDone: true,
        //       onChanged: (f) {},
        //     ),
        //     ToDoListTile(
        //       taskName: "Create an app",
        //       taskDone: false,
        //       onChanged: (f) {},
        //     ),
        //   ],
      ),
    );
  }
}
