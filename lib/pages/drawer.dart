import 'package:counter_7/pages/mywatchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/models/model.dart';
import 'package:counter_7/pages/form.dart';
import 'package:counter_7/pages/result.dart';
import 'package:counter_7/main.dart';

class drawer extends StatelessWidget {
  const drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Adding clickable menu
          ListTile(
              title: const Text('Counter'),
              onTap: () {
                // Routing the menu to the main page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MyHomePage(title: 'Counter Program')),
                );
              }),
          ListTile(
            title: const Text('Form'),
            onTap: () {
              // Routing the menu to the form page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MyFormPage(title: 'Add a Budget Plan')),
              );
            },
          ),
          ListTile(
            title: const Text('Budget Data'),
            onTap: () {
              // Routing the menu to the form page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MyResultPage(title: 'Budget Data')),
              );
            },
          ),
          ListTile(
            title: const Text('Watchlist'),
            onTap: () {
              // Routing the menu to the form page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MyWatchlistPage(title: 'My Watchlist')),
              );
            },
          ),
        ],
      ),
    );
  }
}
