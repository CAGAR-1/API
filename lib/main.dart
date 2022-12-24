import 'dart:convert';

import 'package:apicall/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<User> users = [];

  void FetchData() async {
    print("Calling");
    final url = "https://randomuser.me/api/?results=3";

    var responce = await http.get(Uri.parse(url));
    var data = json.decode(responce.body);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map((e) {
      return User();
    });

    setState(() {
      users = transformed;
    });
    print("Complete");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Rest API Calls"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      FetchData();
                    },
                    child: Text("Fetch Data"))),
            Container(
                height: 400,
                width: 400,
                child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      // final user = users[index];
                      // final age = user.age;
                      // final email = user.gender;
                      return Column(
                        children: [
                          // Text(users[index]['email']),
                          SizedBox(
                            height: 5,
                          ),
                          Text(age),
                          Text(email)

                          // Text(users[index.bitLength].toString()),
                          // Text(images),

                          // Image.network(images)
                        ],
                      );
                    }))
          ],
        )),
      ),
    );
  }
}
