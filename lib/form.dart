import 'package:flutter/material.dart';
import 'package:counter_7/model.dart';
import 'package:counter_7/result.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/drawer.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key, required this.title});
  final String title;
  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _fullTitle = "";
  int _amount = 0;
  String? budgetType;
  List<String> budgetTypes = ['Budget', 'Income'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Budget Info'),
      ),
      drawer: drawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  // Using padding of 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter the title of your budget plan!",
                      labelText: "Title",
                      // Added a circular border to make it neater
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Added behavior when name is typed
                    onChanged: (String? value) {
                      setState(() {
                        _fullTitle = value!;
                      });
                    },
                    // Added behavior when data is saved
                    onSaved: (String? value) {
                      setState(() {
                        _fullTitle = value!;
                      });
                    },
                    // Validator as form validation
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Title cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Using padding of 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter a number for your budget amount!",
                      labelText: "Amount",
                      // Added a circular border to make it neater
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Added behavior when name is typed
                    onChanged: (String? value) {
                      setState(() {
                        _amount = int.parse(value!);
                      });
                    },
                    // Added behavior when data is saved
                    onSaved: (String? value) {
                      setState(() {
                        _amount = int.parse(value!);
                      });
                    },
                    // Validator as form validation
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Amount cannot be empty!';
                      } else if (double.tryParse(value) == null) {
                        return 'Amount needs to be a number!';
                      }
                      return null;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: DropdownButtonFormField(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: budgetTypes.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      hint: const Text("Choose Type"),
                      value: budgetType,
                      onChanged: (String? newValue) {
                        setState(() {
                          budgetType = newValue ?? "";
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          budgetType = value ?? "";
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Type must not be empty!';
                        } else if (value != 'Budget' && value != 'Income') {
                          return 'Type must either be budget or income!';
                        }
                        return null;
                      }),
                ),
                Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                budgetList.add(
                                    Model(_fullTitle, _amount, budgetType));
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AlertDialog(
                                          content: Text('Successfully saved!'));
                                    });
                              }
                            },
                            child: const Text("Save",
                                style: TextStyle(color: Colors.white))))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
