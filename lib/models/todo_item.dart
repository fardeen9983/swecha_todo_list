enum ToDoItemStatus { pending, completed }

class ToDoItem {
  final DateTime deadline;
  final String title;
  final ToDoItemStatus status;

  ToDoItem(
      {required this.deadline,
      required this.title,
      this.status = ToDoItemStatus.pending});

  factory ToDoItem.fromJson(Map<String, dynamic> json) {
    int status = json['status'];
    ToDoItemStatus itemStatus =
        status == 0 ? ToDoItemStatus.pending : ToDoItemStatus.completed;
    return ToDoItem(
        deadline: json['deadline'], title: json['title'], status: itemStatus);
  }

  Map<String, dynamic> toJson() =>
      {"status": status.index, "deadline": deadline, "title": title};
}
