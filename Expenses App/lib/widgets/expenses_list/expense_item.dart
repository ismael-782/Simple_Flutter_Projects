import 'package:expenses_app/module/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(
              height: 4,  
            ),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'), // spicify the num of dicemal places
                const Spacer(),
                Row(children: [
                  Icon(CategortIcons[expense.category]),
                  const SizedBox(width: 8,),
                  Text(expense.formattedDate),
                ],),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
