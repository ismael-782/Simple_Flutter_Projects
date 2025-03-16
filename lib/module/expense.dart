import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }

final formater = DateFormat.yMd();

const CategortIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expense {
  Expense(
      {required this.amount,
      required this.date,
      required this.title,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formater.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expense});

  ExpenseBucket.forCategory(List<Expense> allExpense, this.category)
      : expense = allExpense
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expense;

  double get totalExpenses {
    double sum = 0;
    for (final x in expense) {
      sum += x.amount;
    }
    return sum;
  }
}
