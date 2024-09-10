import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/chart/chart.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Flutter Course",
      amount: 19.199,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Cinema",
      amount: 15.59,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverylay() {
    final height = (MediaQuery.of(context).size.height);
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      constraints: BoxConstraints(maxHeight: height),
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExepnse(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Exense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width);
    // print(MediaQuery.of(context).size.height);

    // print("Width: ${MediaQuery.of(context).size.width}");
    // print("Height: ${MediaQuery.of(context).size.height}");

    Widget mainCOntent = const Center(
      child: Text('No expenses found. start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainCOntent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removeExepnse);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverylay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  'The chart',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: mainCOntent,
                )
              ],
            )
          : Column(
              children: [
                const SizedBox(height: 10),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Text(
                                'The chart',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                                child: Chart(expenses: _registeredExpenses)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: mainCOntent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
