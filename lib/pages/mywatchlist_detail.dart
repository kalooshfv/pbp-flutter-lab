import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/models/model.dart';
import 'package:counter_7/pages/form.dart';
import 'package:counter_7/pages/result.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/pages/drawer.dart';
import 'package:counter_7/pages/mywatchlist_future.dart';
import 'package:counter_7/pages/mywatchlist.dart';

class MyWatchlistPageDetail extends StatefulWidget {
  const MyWatchlistPageDetail(
      {super.key,
      required this.title,
      required this.itemWatched,
      required this.itemTitle,
      required this.itemRating,
      required this.itemReleaseDate,
      required this.itemReview});
  final String title;
  final bool itemWatched;
  final String itemTitle;
  final String itemRating;
  final String itemReleaseDate;
  final String itemReview;

  @override
  _MyWatchlistPageDetailState createState() => _MyWatchlistPageDetailState();
}

class _MyWatchlistPageDetailState extends State<MyWatchlistPageDetail> {
  String item_watched(input) {
    if (input == false) {
      return "No";
    } else {
      return "Yes";
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      drawer: const drawer(),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            // Using padding of 8 pixels
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(widget.itemTitle, style: const TextStyle(fontSize: 20)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Release Date: ${widget.itemReleaseDate}",
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Rating: ${widget.itemRating}",
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Status: ${item_watched(widget.itemWatched)}",
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Review:\n" + widget.itemReview,
            ),
          ),
          Expanded(
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyWatchlistPage(
                                    title: 'My Watchlist')));
                      },
                      child: const Text("Back",
                          style: TextStyle(color: Colors.white)))))
        ]),
      ),
    );
  }
}
