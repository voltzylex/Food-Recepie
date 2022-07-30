// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var dish_name = ["Poha", "Ras Gulla", "Dhokla", "Wada Paw", "Manchuriyan"];
    final _random = new Random();
    var dish = dish_name[_random.nextInt(dish_name.length)];
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Using Container in Stack to add Back ground Gradient Color ©️©️©️
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // Using Gradient Color Combination 💢
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xff213A50), Color(0xff071938)],
            )),
          ),

          // Search Bar Code 🔎🔎🔎

          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              // color: Colors.white,
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(24)),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            print("Search Me");
                          },
                          child: Container(
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                          )),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Seach $dish',
                              border: InputBorder.none),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Search Bar Ended 🔍🔍🔍
          ),
        ],
      ),
    );
  }
}
