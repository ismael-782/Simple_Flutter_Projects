import 'package:expenses_app/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        
      ),
      home: const Expenses(),
    ),
  );
}
