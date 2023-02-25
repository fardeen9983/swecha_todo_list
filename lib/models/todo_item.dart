import 'package:intl/intl.dart';

enum ToDoItemStatus { pending, completed }

class ToDoItem {
  final DateTime deadline;
  final String title;
  final String id;
  ToDoItemStatus status;

  ToDoItem(
      {required this.id,
      required this.deadline,
      required this.title,
      this.status = ToDoItemStatus.pending});

  factory ToDoItem.fromJson(Map<String, dynamic> json) {
    int status = json['status'] ?? 0;
    ToDoItemStatus itemStatus =
        status == 0 ? ToDoItemStatus.pending : ToDoItemStatus.completed;
    return ToDoItem(
        id: json['id'],
        deadline: DateTime.parse(json['deadline']),
        title: json['title'],
        status: itemStatus);
  }

  Map<String, dynamic> toJson() => {
        "status": status == ToDoItemStatus.pending ? 0 : 1,
        "deadline": DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(deadline),
        "title": title,
      };
}
