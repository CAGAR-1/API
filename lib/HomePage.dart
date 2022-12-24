import 'dart:convert';

import 'package:apicall/models/model.dart';
// import 'package:apicall/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Fulldetails> fulldetails = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: fulldetails.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GetText(
                                    index,
                                    fulldetails[index].url,
                                    fulldetails[index].title,
                                    fulldetails[index].thumbnailUrl)

                                // GetText(index, 'ID',
                                //     fulldetails[index].id.toString()),

                                // GetText(
                                //     index,
                                //     fulldetails[index].name,
                                //     fulldetails[index].address.street,
                                //     fulldetails[index].address.geo.lat)
                              ],
                            ),
                          ),
                          color: Colors.pink,
                          height: 200,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
          // return CircularProgressIndicator();
          return Container();
        },
      ),
    );
  }

  Column GetText(int index, String MainUrl, String title, String thumbnailUrl) {
    return Column(
      children: [
        Text(title),
        Image.network(MainUrl.toString()),
        Image.network(thumbnailUrl.toString()),
      ],
    );
  }

  final url = "http://jsonplaceholder.typicode.com/photos";
  Future<List<Fulldetails>> getData() async {
    final responce = await http.get(Uri.parse(url));
    var data = jsonDecode(responce.body.toString());
    if (responce.statusCode == 200) {
      print("Hit Sucessfully");
      print(fulldetails.length);

      for (Map<String, dynamic> index in data) {
        fulldetails.add(Fulldetails.fromJson(index));
      }
    } else {}
    return fulldetails;
  }
}
