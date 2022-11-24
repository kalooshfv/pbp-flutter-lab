import 'package:counter_7/models/watchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/models/model.dart';
import 'package:counter_7/pages/form.dart';
import 'package:counter_7/pages/result.dart';
import 'package:counter_7/main.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class watchlist_future {
  Future<List<Watchlist>> fetchWatchlist() async {
    var url =
        Uri.parse('https://pbd22-assignment2.herokuapp.com/mywatchlist/json/');
    print("Fetching...");
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
    print("Converting...");
    // decode the response into the json form
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    print("Put into list...");
    print(data);
    // convert the json data into Watchlist object
    List<Watchlist> listWatchlist = [];
    print("List created...");
    for (var d in data) {
      print(d);
      if (d != null) {
        listWatchlist.add(Watchlist.fromJson(d));
        print(listWatchlist);
      }
    }
    print(listWatchlist);
    return listWatchlist;
  }
}
