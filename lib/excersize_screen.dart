import 'package:flutter/material.dart';
import 'package:flutterfitnessapp/ExcersizeHelper.dart';
import 'package:flutterfitnessapp/excersize_start_screen.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ExcersizeScreen extends StatefulWidget {
  final Exercises exercises;
  ExcersizeScreen({this.exercises});
  @override
  _ExcersizeScreenState createState() => _ExcersizeScreenState();
}

class _ExcersizeScreenState extends State<ExcersizeScreen> {
  int seconds = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Hero(
          tag: widget.exercises.id,
          child: Stack(
            children: <Widget>[
              Image(
                image: NetworkImage(widget.exercises.thumbnail),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Center(
                child: Container(
                  child: RaisedButton(
                    padding: EdgeInsets.all(10),
                    color: Colors.redAccent,
                    child: Text(
                      "Start Excersize",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExcerSizeStartScreen(
                                    exercises: widget.exercises,
                                    seconds: seconds,
                                  )));
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(),
                    onChange: (double value) {
                      seconds = value.toInt();
                    },
                    initialValue: 30,
                    min: 10,
                    max: 60,
                    innerWidget: (v) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${v.toInt()}s",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
