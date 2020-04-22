import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterfitnessapp/ExcersizeHelper.dart';

class ExcerSizeStartScreen extends StatefulWidget {
  final Exercises exercises;
  final int seconds;
  ExcerSizeStartScreen({this.exercises, this.seconds});
  @override
  _ExcerSizeStartScreenState createState() => _ExcerSizeStartScreenState();
}

class _ExcerSizeStartScreenState extends State<ExcerSizeStartScreen> {
  bool _isCompleted;
  int _elapseSeconds = 0;
  Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (t.tick == widget.seconds) {
        t.cancel();
        setState(() {
          _isCompleted = true;
        });
      }
      setState(() {
        _elapseSeconds = t.tick;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: FadeInImage(
                placeholder: AssetImage(
                  "assets/placeholder.png",
                ),
                image: NetworkImage(widget.exercises.gif),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.cover,
              ),
            ),
            _isCompleted != true
                ? Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(bottom: 50),
                    child: Text(
                      "$_elapseSeconds/${widget.seconds}s",
                      style: TextStyle(fontSize: 40),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
