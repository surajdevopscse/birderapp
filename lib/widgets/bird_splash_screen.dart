import 'dart:async';

import 'package:birderapp/widgets/birderapp.dart';
import 'package:flutter/material.dart';

class BirdSplashScreen extends StatefulWidget {
  const BirdSplashScreen({Key? key}) : super(key: key);

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
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Image.network(
            'https://lh3.googleusercontent.com/proxy/kbZfz00EOl6UY-7o0l06_kbkmcI8vPR2EP-YLrH8XR8WSdl8wAVRwWydpuKeoiZBtvhnQM-D6CQGsK47VQj42l8oRC4PEvqZO3UuBsFHvnBZ1J8SYPgNVx8'),
      ),
    );
  }
}
