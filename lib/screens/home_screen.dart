import 'package:flutter/material.dart';
import 'package:todo_list/colors.dart';
import 'package:todo_list/models/todo_item.dart';
import 'package:todo_list/todo_service.dart';
import 'package:todo_list/widgets/completed_todo_item.dart';
import 'package:todo_list/widgets/pending_todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ToDoService _service = ToDoService();

  @override
  Widget build(BuildContext context) {
    List<ToDoItem> items = _service.items;
    List<ToDoItem> pending = items
        .where((element) => element.status == ToDoItemStatus.pending)
        .toList();
    List<ToDoItem> completed = items
        .where((element) => element.status == ToDoItemStatus.completed)
        .toList();

    print(pending.length);
    print(completed.length);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorResource.primary,
        onPressed: () {
          Navigator.pushNamed(context, "/add").then((value) => setState(() {}));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: ColorResource.primary,
        elevation: 0,
        title: const Text("ToDo List"),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              color: ColorResource.primary,
              child: const TabBar(tabs: [
                Tab(
                  text: "Pending",
                ),
                Tab(
                  text: "Completed",
                )
              ]),
            ),
            Expanded(
                child: TabBarView(children: [
              pending.isNotEmpty
                  ? ListView.builder(
                      itemCount: pending.length,
                      itemBuilder: (ctx, index) {
                        ToDoItem item = pending[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PendingToDoItem(
                              item: item, onPressed: () => setState(() {})),
                        );
                      })
                  : const Center(
                      child: Text(
                      "No Pending Tasks",
                      style: TextStyle(color: ColorResource.primary),
                    )),
              completed.isNotEmpty
                  ? ListView.builder(
                      itemCount: completed.length,
                      itemBuilder: (ctx, index) {
                        ToDoItem item = completed[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CompletedToDoItem(
                              item: item, onPressed: () => setState(() {})),
                        );
                      })
                  : const Center(
                      child: Text(
                      "No Completed Tasks",
                      style: TextStyle(color: ColorResource.primary),
                    )),
            ])),
          ],
        ),
      ),
    );
  }
}
