import 'dart:async';

import 'package:birderapp/widgets/birderapp.dart';
import 'package:flutter/material.dart';

class BirdSplashScreen extends StatefulWidget {
  @override
  _BirdSplashScreenState createState() => _BirdSplashScreenState();
}

class _BirdSplashScreenState extends State<BirdSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 10),
      () => Navigator.of(context).pushReplacementNamed(
        BirderApp.routeName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Image(
          image: NetworkImage(
              'https://lh3.googleusercontent.com/proxy/QVxnWj_JGN4xvB5yS4QZHcOcj9rbcgVAIJmh-Y9j0Qzae4N5YoPJO7P6p3Gb2jJ7iJqeoKCpoSb1ipQy9Tn7Gb4PY4MhGgUVEDh5eVd358vVd8Kch4QQP8s'),
        ),
      ),
    );
  }
}
