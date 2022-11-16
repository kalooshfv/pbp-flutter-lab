import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/result.dart';
import 'package:counter_7/main.dart';

var budgetList = [];
Widget getBudget(Model budget) {
  Widget title = Text(budget.budgetTitle);
  Widget amount = Text(budget.budgetAmount.toString());
  Widget type = Text(budget.budgetType!);
  return ListView(children: [title, amount, type]);
}

class Model {
  String budgetTitle = '';
  int budgetAmount = 0;
  String? budgetType;

  Model(String budgetTitle, int budgetAmount, String? budgetType) {
    this.budgetTitle = budgetTitle;
    this.budgetAmount = budgetAmount;
    this.budgetType = budgetType;
  }
}
