import 'package:flutter/material.dart';

enum Priority { urgent, normal, low }

class CheckableTodoItem extends StatefulWidget {
  const CheckableTodoItem(this.text, this.priority, {super.key});

  final String text;
  final Priority priority;

  @override
  State<CheckableTodoItem> createState() {
    return _CheckableTodoItemState();
  }
}

class _CheckableTodoItemState extends State<CheckableTodoItem> {
  var _done = false;

  void _setDone(bool? isChecked) {
    setState(() {
      _done = isChecked ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    IconData icon;

    switch (widget.priority) {
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
          Checkbox(
            value: _done,
            onChanged: _setDone,
          ),
          const SizedBox(width: 12),
          Icon(icon),
          const SizedBox(width: 12),
          Expanded(
            child: Text(widget.text),
          ),
        ],
      ),
    );
  }
}
