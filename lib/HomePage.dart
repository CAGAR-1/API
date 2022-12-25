import 'dart:convert';
import 'package:apicall/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  @override
  void initState() {
    loadMovies();
    // TODO: implement initState
    super.initState();
  }

  String apiKey = '31dda82c9c7a3a73884e0c0c598ac8cd';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMWRkYTgyYzljN2EzYTczODg0ZTBjMGM1OThhYzhjZCIsInN1YiI6IjYzYTg2Yjc2ZTRiNTc2MDA4NWJlYjE1MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lwo0oTG7qsoQ-96r82LaxcTuRYlSZ6_PUIFrMikoPxI';

  loadMovies() async {
    TMDB tmdbWithCutomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await tmdbWithCutomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCutomLogs.v3.movies.getTopRated();
    Map tvreasult = await tmdbWithCutomLogs.v3.tv.getPopular();

    trendingmovies.add(trendingresult);
    topratedmovies.add(topratedresult);
    tv.add(tvreasult);
    print(tv[0]);

    // print(trendingresult);
  }

  List<Fulldetails> fulldetails = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadMovies(),
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
