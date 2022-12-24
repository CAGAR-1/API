import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "The use User ID one",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text("The Is Title", style: TextStyle(fontSize: 30)),
                        Text("TheIS IS BODY", style: TextStyle(fontSize: 30)),
                      ],
                    ),
                  ),
                  color: Colors.pink,
                  height: 200,
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
