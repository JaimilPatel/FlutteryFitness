import 'package:flutter/material.dart';
import 'package:flutterfitnessapp/HomePage.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Treadmill",
          body:
              "Treadmills are among the most popular types of cardio fitness equipment for both gym and home use.",
          image: _buildImage('screen1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Stationary Bike",
          body:
              "Cycling is mainly an aerobic activity, which means that your heart, blood vessels and lungs all get a workout. ",
          image: _buildImage('screen2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Pull ups",
          body:
              "The most obvious draw is that they build and strengthen your upper body—specifically, the muscles in your back, chest, shoulders, and arms. ",
          image: _buildImage('screen3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Muscular Body",
          body:
              "The muscular system is responsible for the movement of the human body.",
          image: _buildImage('screen4'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Dumbell",
          body:
              "Your goals dictate the range of reps you should perform, and for how many sets you should do them",
          image: _buildImage('screen5'),
          decoration: pageDecoration,
          footer: RaisedButton(
            onPressed: () {
              introKey.currentState?.animateScroll(0);
            },
            child: const Text(
              'Go to First',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
