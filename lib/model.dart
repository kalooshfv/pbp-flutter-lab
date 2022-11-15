import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/result.dart';
import 'package:counter_7/main.dart';

var budgetList = [];
Widget getBudget(Model budget) {
  Widget title = Text(budget.budgetTitle);
  Widget amount = Text(budget.budgetAmount);
  Widget type = Text(budget.budgetType!);
  return ListView(children: [title, amount, type]);
}

class Model {
  String budgetTitle = '';
  String budgetAmount = '';
  String? budgetType;

  Model(String budgetTitle, String budgetAmount, String? budgetType) {
    this.budgetTitle = budgetTitle;
    this.budgetAmount = budgetAmount;
    this.budgetType = budgetType;
  }
}
