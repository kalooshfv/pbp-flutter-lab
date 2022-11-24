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
import 'package:counter_7/pages/mywatchlist_detail.dart';
import 'package:counter_7/models/watchlist.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({super.key, required this.title});
  final String title;

  @override
  _MyWatchlistPageState createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  @override
  Widget build(BuildContext context) {
    Color movieColor(input) {
      if (input == false) {
        return Colors.red;
      } else {
        return Colors.blue;
      }
    }

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
        body: FutureBuilder(
            future: watchlist_future().fetchWatchlist(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Watchlist is empty :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              color: movieColor(
                                  snapshot.data![index].fields.itemWatched),
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: const [
                                BoxShadow(color: Colors.black, blurRadius: 2.0)
                              ]),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyWatchlistPageDetail(
                                                  title:
                                                      '${snapshot.data![index].fields.itemTitle}',
                                                  itemTitle:
                                                      '${snapshot.data![index].fields.itemTitle}',
                                                  itemWatched: snapshot
                                                      .data![index]
                                                      .fields
                                                      .itemWatched,
                                                  itemRating:
                                                      '${snapshot.data![index].fields.itemRating}',
                                                  itemReleaseDate:
                                                      '${snapshot.data![index].fields.itemReleaseDate}',
                                                  itemReview:
                                                      '${snapshot.data![index].fields.itemReview}',
                                                )));
                                  },
                                  child: Text(
                                    "${snapshot.data![index].fields.itemTitle}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_box_rounded),
                                  iconSize: 25,
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      snapshot.data![index].fields.itemWatched =
                                          !snapshot
                                              .data![index].fields.itemWatched;
                                    });
                                  },
                                ),
                              ])));
                }
              }
            }));
  }
}
