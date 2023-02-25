import 'package:flutter/material.dart';
import 'package:swecha_todo_list/colors.dart';
import 'package:swecha_todo_list/models/todo_item.dart';
import 'package:swecha_todo_list/todo_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ToDoItem> items = ToDoService().items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorResource.primary,
        title: const Text(
          "ToDo List",
          style: TextStyle(fontSize: 26),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                color: ColorResource.primary,
                child: const TabBar(
                    dividerColor: Colors.green,
                    labelStyle: TextStyle(fontSize: 18),
                    tabs: [
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
                  ListView.builder(itemBuilder: (ctx, index) => Container()),
                  ListView.builder(itemBuilder: (ctx, index) => Container()),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
