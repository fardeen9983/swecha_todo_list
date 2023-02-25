import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/colors.dart';
import 'package:todo_list/models/todo_item.dart';
import 'package:todo_list/todo_service.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  String task = "";
  DateTime dateTime = DateTime.now();

  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResource.primary,
        elevation: 0,
        title: const Text("Add Item"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tasks",
                style: TextStyle(color: ColorResource.primary),
              ),
              TextFormField(
                controller: _controller,
                minLines: 4,
                maxLines: 10,
                decoration: const InputDecoration(
                  hintText: "Eg. Buy Essentials",
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(dateTime),
                    style: const TextStyle(
                        color: ColorResource.primary, fontSize: 22),
                  ),
                  IconButton(
                      onPressed: () async {
                        var now = DateTime.now();
                        var result = await showDatePicker(
                            context: context,
                            initialDate: now,
                            firstDate: now,
                            lastDate: now.add(const Duration(days: 3000)));
                        if (result != null) {
                          setState(() {
                            dateTime = result;
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.calendar_month,
                        color: ColorResource.primary,
                      )),
                ],
              ),
              const Expanded(child: SizedBox()),
              InkWell(
                onTap: onSubmit,
                child: Container(
                  decoration: const BoxDecoration(
                    color: ColorResource.primary,
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 28),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              )
            ],
          ),
        ),
      ),
    );
  }

  void onSubmit() async {
    String value = _controller.text;
    if (value.isNotEmpty) {
      await ToDoService().addToDoItem(ToDoItem(
          id: ID.unique(),
          deadline: dateTime,
          title: value));
    }
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
