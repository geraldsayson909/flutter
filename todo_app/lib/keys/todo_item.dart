import 'package:flutter/material.dart';

enum Priority { urgent, normal, low }

class TodoItem extends StatelessWidget {
  const TodoItem(this.text, this.priority, {super.key});

  final String text;
  final Priority priority;

//   @override
//   State<TodoItem> createState() {
//     return _TodoItemState();
//   }
// }

// class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    IconData icon;

    switch (priority) {
      case Priority.urgent:
        icon = Icons.airplane_ticket_sharp;
        break;
      case Priority.normal:
        icon = Icons.run_circle;
        break;
      case Priority.low:
        icon = Icons.low_priority;
        break;
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Text(text),
        ],
      ),
    );
  }
}
