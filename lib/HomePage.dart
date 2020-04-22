import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterfitnessapp/ExcersizeHelper.dart';
import 'package:flutterfitnessapp/excersize_screen.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String apiUrl =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";
  ExcersizeHelper excersizeHelper;
  @override
  void initState() {
    getExcersizeData();
    super.initState();
  }

  void getExcersizeData() async {
    var response = await http.get(apiUrl);
    var body = response.body;
    var json = jsonDecode(body);
    excersizeHelper = ExcersizeHelper.fromJson(json);
    print(body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Excersize List"),
      ),
      body: Container(
          child: excersizeHelper != null
              ? ListView(
                  children: excersizeHelper.exercises.map((e) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExcersizeScreen(
                                      exercises: e,
                                    )));
                      },
                      child: Hero(
                        tag: e.id,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0)),
                          child: Stack(children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image(
                                image: NetworkImage(e.thumbnail),
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                    Color(0xFF000000),
                                    Color(0x00000000)
                                  ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.center)),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 20,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  e.title,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            )
                          ]),
                        ),
                      ),
                    );
                  }).toList(),
                )
              : Center(child: CircularProgressIndicator())),
    );
  }
}
