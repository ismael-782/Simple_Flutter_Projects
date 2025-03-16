import 'package:expenses_app/module/expense.dart';
import 'package:expenses_app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExp});

  final void Function(Expense expense) onRemoveExp;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(color: const Color.fromARGB(157, 244, 67, 54),),
        onDismissed: (direction) {
          onRemoveExp(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
