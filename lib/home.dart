import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xff213A50), Color(0xff071938)],
            )),
          ),
          SafeArea(
              child: Text(
            'hello i am Home Page',
            style: TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }
}
