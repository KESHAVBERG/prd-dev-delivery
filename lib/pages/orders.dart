import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> getorder() async {
  final response =
  await http.get(Uri.parse('http://172.16.9.149:8000/api/viewOrders')).then((value) {
    print(value.body);
  });

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final int id;
  final String email;

  const Album({
    required this.id,
    required this.email,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      email: json['orderBy'],
    );
  }
}

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  late Future<Album> futureAlbum;


  @override
  void initState() {
    // TODO: implement initState
    futureAlbum = getorder();
    super.initState();
  }

  Widget getordersTitle(String name, dish, time) {
    return Card(
      child: ListTile(
        trailing: TextButton(
          onPressed: () {},
          child: Text("accept"),
        ),
        title: Text("Order from, ${name}"),
        subtitle: Text("${dish}, placed at ${time}"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            print(snapshot.data?.email);
            if (snapshot.hasData) {
              return Text(snapshot.data!.email);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
