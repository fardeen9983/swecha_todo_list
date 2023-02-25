import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/todo_item.dart';
import 'package:todo_list/todo_service.dart';

class CompletedToDoItem extends StatelessWidget {
  CompletedToDoItem({Key? key, required this.item, required this.onPressed})
      : super(key: key);
  final ToDoItem item;
  final _service = ToDoService();
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        subtitle:
            Text(DateFormat(DateFormat.YEAR_MONTH_DAY).format(item.deadline)),
        title: Text(
          item.title,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        trailing: IconButton(
            onPressed: () {
              _service.items.remove(item);
              onPressed();
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            )),
      ),
    );
  }
}
