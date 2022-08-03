// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:food_recepie/models.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();

  List<RecepieModel> recepieList = <
      RecepieModel>[]; //Creating a List for {Array} Recepie calling And Storing  for APi

  void getRecepie(String query) async {
    String url =
        "https://api.edamam.com/search?q=$query&app_id=f30f4973&app_key=cee0238ac891c32bf29fe44eb43f84db";
    var response = await http.get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    data["hits"].forEach((element) {
      RecepieModel recepieModel = new RecepieModel();
      recepieModel = RecepieModel.fromMap(element["recipe"]);
      recepieList.add(recepieModel);
      // dev.log(recepieList.toString());
    });

    recepieList.forEach((Recepie) {
      print(Recepie.appLabel);
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getRecepie("Dhokla");
  }

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

          SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    // color: Colors.white,

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            if ((searchController.text).replaceAll(" ", "") ==
                                "") {
                              print("Blank search");
                            } else {
                              getRecepie(searchController.text);
                            }
                          },
                          child: Container(
                            child: Icon(
                              Icons.search,
                              color: Colors.blue,
                            ),
                            margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                                hintText: 'Seach $dish',
                                border: InputBorder.none),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Search Bar Ended 🔍🔍🔍
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "WHAT DO YOU WANT TO COOK TODAY?",
                        style: TextStyle(fontSize: 33, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Let's Cook Something New!",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Container(
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 2000,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return SushilName();
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget SushilName() {
  return Text("Sushil Kumar", style: TextStyle(color: Colors.white));
}
// https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=591-722&health=alcohol-free
